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
            sortby: "country"
        }

        model: jsonModel1.model

        section.property: "country"
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
               source: if (section.search(".png")>0) "../allradio-data/images/"+section.toLowerCase()+".png"; else "../allradio-data/images/"+section.toLowerCase()+".png";
            }

            Text {
                 id: showName
                 text: findCountry(section.toLowerCase()) ? findCountry(section.toLowerCase()) : qsTr("Unknown") //findCountry(section.toLowerCase())
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
            title: searchby !== "bytag" ? "" : searchterm

            SearchField {
                id: searchField
                visible: searchby !== "bytag" ? true : false
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
        height: menuOpen ? contextMenu.height + contentItem.height : contentItem.height

        function remove() {
            remorseAction("Deleting", function() { delDb(source);listView.model.remove(index) })
        }

        Image {
           id: speakerIcon
           height: parent.height / 2
           visible: streaming && currentid == model.id ? true : false
           fillMode: Image.PreserveAspectFit
           anchors.verticalCenter: parent.verticalCenter
           anchors.left: parent.left
           anchors.leftMargin: Theme.paddingMedium
           source: streaming && currentid == model.id ? "image://theme/icon-m-speaker?" + Theme.highlightColor : ""
        }

        Label {
             id: firstName
             text: internal ? model.title : name
             color: highlighted ? Theme.highlightColor : Theme.primaryColor
             anchors.left: speakerIcon.right
             anchors.right: codlabel.left
             anchors.leftMargin: Theme.paddingMedium
             anchors.rightMargin: Theme.paddingMedium
             anchors.verticalCenter: parent.verticalCenter
             font.pixelSize: Theme.fontSizeMedium
             truncationMode: TruncationMode.Fade
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

            MenuItem {
                visible: searchby == "bytag" ? true : false
                text: qsTr("Search by name")
                onClicked: {window.pageStack.navigateBack(PageStackAction.Immediate);window.pageStack.replace(Qt.resolvedUrl("Search.qml"),{searchby: "byname"})}
            }
            MenuItem {
                visible: searchby == "bytag" ? false : true
                text: qsTr("Search by tag")
                onClicked: window.pageStack.replace(Qt.resolvedUrl("Tags.qml"),{searchby: "bytag"})
            }
        }    }
    PlayerPanel { id:playerPanel}
}

