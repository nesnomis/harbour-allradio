import QtQuick 2.0
import Sailfish.Silica 1.0
import "../JSONListModel"


Page {
    property string title: ""
    property string searchterm: ""
    property string searchtitle: ""
    property string searchby: "byname"
    property string filter: searchterm
    property bool searching: false
    property string oldsource: ""
    property alias source: jsonModel1.source
    property bool showlogo: searchby === "lastchange" || searchby === "mostclick" || searchby === "lastplay" || searchby === "mostvote" ? true : false
    property bool showsearch: searchby === "bytag" || searchby === "lastchange"  || searchby === "lastplay" || searchby === "mostclick" || searchby === "mostvote" ? false : true
    property string showsection: searchby === "lastchange" || searchby === "mostclick" || searchby === "lastplay" || searchby === "mostvote" ? "" : "country"
    property string pageheader: if (searchby == "byname") ""; else if (searchby == "bytag") "Tags"; else if (searchby == "lastchange") qsTr("New or changed stations"); else if (searchby == "lastplay") qsTr("Latest played stations");else if (searchby == "mostclick") qsTr("Most played stations");else if (searchby == "mostvote") qsTr("Most liked stations")

    width: parent.width
    height: parent.height

    SilicaListView {
        id: listView
        anchors.fill: parent
        anchors.bottomMargin: playerPanel.visibleSize
        clip: true

        ScrollDecorator {}

        JSONListModel {
            id: jsonModel1
            query: "$[*]"
            sortby: showsection //searchby == "lastchange" || searchby == "mostclick" || searchby == "lastplay" ? "" : "country"
        }

        model: jsonModel1.model

        section.property: showsection
        section.criteria: ViewSection.FullString
        section.delegate: ListItem {
            id: sectionHeading

            OpacityRampEffect {
                sourceItem: showRect
                direction: OpacityRamp.TopToBottom
                offset: 0.0
                slope: 1.0
            }

            Rectangle {
                 id: showRect
                 anchors.left: parent.left
                 anchors.right: parent.right
                 width: parent.width
                 height: showName.height + Theme.paddingLarge
                 color: Theme.rgba(Theme.highlightBackgroundColor, Theme.highlightBackgroundOpacity)
            }

            Image {
               id: countryIcon
               height: parent.height / 2
               fillMode: Image.PreserveAspectFit
               anchors.verticalCenter: showRect.verticalCenter
               anchors.left: showRect.left
               anchors.leftMargin: Theme.paddingMedium
               source: if (searchby === "lastchange")  "" ; else if (section.search(".png")>0) "../allradio-data/images/"+section.toLowerCase()+".png"; else section ? "../allradio-data/images/"+section.toLowerCase()+".png" : "../allradio-data/images/no country.png";
            }

            Text {
                 id: showName
                 text: searchby === "lastchange" ? section : findCountry(section.toLowerCase()) ? findCountry(section.toLowerCase()) : qsTr("Unknown") //findCountry(section.toLowerCase())
                 color: highlighted ? Theme.highlightColor : Theme.primaryColor
                 anchors.leftMargin: Theme.paddingMedium
                 anchors.rightMargin: Theme.paddingMedium
                 anchors.left: countryIcon.right
                 anchors.right: parent.right
                 anchors.verticalCenter: showRect.verticalCenter
                 wrapMode: Text.ElideRight
                 font.pixelSize: Theme.fontSizeLarge
                 font.capitalization: section == "0" ? Font.MixedCase : Font.Capitalize
                 maximumLineCount: 1
            }
        }

        header: PageHeader {
            id: pHeader
            title: pageheader

            SearchField {
                id: searchField
                visible: showsearch
                anchors.fill: parent
                placeholderText: searchtitle
                text: searchterm
                inputMethodHints: Qt.ImhNoAutoUppercase //| Qt.ImhNoPredictiveText
                EnterKey.iconSource: "image://theme/icon-m-enter-close"
                EnterKey.onClicked: {focus = false;searching= false}
                focus: true
                onTextChanged: if (text.length > 1) jsonModel1.source = "http://www.radio-browser.info/webservice/json/stations/"+searchby+"/"+text; else {jsonModel1.source = "";focus=true;jsonModel1.model.clear()}
                onClicked: {listView.currentIndex = -1;showPlayer = false;searching=true}
            }
        }

        property int retning: 0
        onContentYChanged: {
            if (!searching && atYBeginning) showPlayer = true
            if (atYEnd) showPlayer = false
            }
            onMovementStarted: {
                retning = contentY
            }
            onVerticalVelocityChanged: {
                if (!searching && contentY > retning+10) showPlayer = false; else if (!searching && contentY < retning-10) showPlayer = true;
            }
            onMovementEnded: {
                //if (!showPlayer && contentY == -110) showPlayer = true
                    //console.log("verticalVolocity: "+verticalVelocity+" - contentY: "+contentY)
            }

        delegate: ListItem {
        id: myListItem
        menu: contextMenu
        showMenuOnPressAndHold: true
        ListView.onRemove: animateRemoval(myListItem)

        width: ListView.view.width
        height: menuOpen ? contextMenu.height + contentItem.height + Theme.paddingMedium : contentItem.height + Theme.paddingMedium
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: Theme.paddingMedium
        anchors.rightMargin: Theme.paddingMedium

        function remove() {
            remorseAction("Deleting", function() { delDb(source);listView.model.remove(index) })
        }

        Image {
           id: speakerIcon
           height: parent.height / 2
           visible: streaming && currentid == model.id ? true : false
           fillMode: Image.PreserveAspectFit
           anchors.verticalCenter: parent.verticalCenter
           anchors.left: logo2.right
           anchors.leftMargin: Theme.paddingMedium
           source: streaming && currentid == model.id ? "image://theme/icon-m-speaker?" + Theme.highlightColor : ""
        }


        Image {
            id: logo2
            visible: showlogo
            height: parent.height / 2
            fillMode: Image.PreserveAspectFit
            anchors.left: parent.left
            anchors.leftMargin: Theme.paddingMedium
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: Theme.paddingMedium
            source: !showlogo ? "" : country ? "../allradio-data/images/"+ country.toLowerCase() + ".png" : "../allradio-data/images/no country.png"
        }

        Column {
            anchors.left: speakerIcon.right
            anchors.right: codlabel.visible ? codlabel.left : bit.left
            anchors.leftMargin: Theme.paddingMedium
            anchors.rightMargin: Theme.paddingMedium
            anchors.verticalCenter: parent.verticalCenter
            Label {
                 id: firstName
                 text: internal ? model.title : name
                 color: highlighted ? Theme.highlightColor : Theme.primaryColor
                 font.pixelSize: Theme.fontSizeMedium
                 truncationMode: TruncationMode.Fade
                 width: parent.width
             }
            Label {
                 id: rtags
                 visible: tags !== "" ? true : false
                 text: tags
                 color: highlighted ? Theme.highlightColor : Theme.secondaryColor
                 font.pixelSize: Theme.fontSizeExtraSmall
                 truncationMode: TruncationMode.Fade
                 width: parent.width
             }
        }
        Label {
            id: codlabel
             text: internal ? "" : codec == "UNKNOWN" ? "" : codec
             color: highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
             anchors.verticalCenter: parent.verticalCenter
             anchors.right: bit.left
             anchors.rightMargin: Theme.paddingMedium
             font.pixelSize: Theme.fontSizeSmall
             font.italic: true
         }

        Label {
             id: bit
             text: internal ? "" : bitrate == 0 && codec == "UNKNOWN" ? "UNKNOWN" : bitrate == 0 ? "" : bitrate
             visible: !internal
             color: highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
             anchors.right: parent.right
             anchors.rightMargin: Theme.paddingMedium
             anchors.verticalCenter: parent.verticalCenter
             font.pixelSize: Theme.fontSizeSmall
             font.italic: true
         }

        onClicked: {
            internal ? ps(source) : cps(model.id)
            radioStation = internal ? title : name
            if (favorites && icon.search(".png")>0) picon = icon.toLowerCase(); // The old save in database
            else if (favorites) picon = "../allradio-data/images/"+icon+".png"; else picon = "../allradio-data/images/"+country.toLowerCase()+".png"
            website = internal ? (Qt.resolvedUrl(site)) : Qt.resolvedUrl(homepage)
        }

         ContextMenu {
             id: contextMenu
             MenuItem {
                 id:mlisten
                 visible: true
                 text: qsTr("Listen")
                 onClicked: {
                     internal ? ps(source) : cps(model.id)
                     radioStation = internal ? title : name
                     if (favorites && icon.search(".png")>0) picon = icon.toLowerCase(); // The old save in database
                     else if (favorites) picon = "../allradio-data/images/"+icon+".png"; else picon = "../allradio-data/images/"+country.toLowerCase()+".png"
                     website = internal ? (Qt.resolvedUrl(site)) : Qt.resolvedUrl(homepage)
                 }
             }
             MenuItem {
                 id:mrep
                 visible: oldsource !== "" ? true : false
                 text: qsTr("Replace in favorites")  // source, title, site, section, icon, old, codec, bitrate
                 onClicked: {updateDb(oldsource,id,lastchangetime,url,name,homepage,tags,country,codec,bitrate);window.pageStack.pop()}
                 }
             MenuItem {
                 id:madd
                 visible: !mrep.visible
                 text: qsTr("Add to favorites")  // id, lastchangetime, source, title, site, tags, icon, codec, bitrate
                 onClicked: addDb(id,lastchangetime,url,name,homepage,tags,country,codec,bitrate)
                 }
             MenuItem {
                 id:mdelete
                 visible: favorites
                 text: qsTr("Delete favourite")

                 onClicked: remove()//listView.currentItem.remove(rpindex,rpsource) //listView.remorseAction();
             }
         }
        }

        ViewPlaceholder {
            enabled: listView.count === 0 //|| jsonModel1.jsonready
            text: qsTr("Search radio stations")
            hintText: qsTr("Enter (or change) text in searchfield")
        }

        PullMenu {
            visible: oldsource !== "" ? false : true
        }
    }
    PlayerPanel { id:playerPanel}
}

