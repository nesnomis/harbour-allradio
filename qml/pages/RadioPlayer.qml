import QtQuick 2.0
import Sailfish.Silica 1.0
import "../JSONListModel"

Page {
    id: radioPage
    property alias model: listView.model
    property bool searching: false

    SilicaListView {
        id: listView
        anchors.fill: parent
        anchors.bottomMargin: playerPanel.visibleSize
        clip: true

        JSONListModel {
            id: jsonModel1
            source: internal ? "../allradio-data/stations/"+country+".json" : "http://www.radio-browser.info/webservice/json/stations/bycountryexact/"+country
            query: internal ? "$."+country+".channel[*]" : "$[?(@.lastcheckok>0)]"
            sortby: internal ? "title" : ""
            filterby: filter
            filterkey: key
        }

        model: jsonModel1.model

        header: PageHeader {
            id: pHeader
            title: favorites ? ctitle : ""

            Row {
                enabled: !favorites
                visible: !favorites
                anchors.verticalCenter: parent.verticalCenter
                anchors.fill: parent
                spacing: Theme.paddingLarge

                SearchField {
                    id: searchField
                    width: parent.width - logo2.width - (Theme.paddingMedium * 2 )
                    placeholderText: "Search"
                    inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhNoPredictiveText
                    EnterKey.iconSource: "image://theme/icon-m-enter-close"
                    EnterKey.onClicked: {focus = false;searching= false}
                    focus: true
                    onTextChanged: if (text.length > 0) filter = text; else {filter = "";focus=true;}
                    onClicked: {listView.currentIndex = -1;showPlayer = false;searching=true}
                }

                Image {
                    id: logo2
                    height: parent.height / 2
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: Theme.paddingMedium
                    source:  country !== "" ? "../allradio-data/images/"+ country + ".png" : "../harbour-allradio.png"
                }
            }
        }

        VerticalScrollDecorator {}

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
                        id:madd
                        visible: !favorites
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

            PullMenu {}

            ViewPlaceholder {
                enabled: listView.count === 0 //|| jsonModel1.jsonready
                text: qsTr("No radio stations!?")
                hintText: qsTr("Be patient or check connection!")
            }
    }
    PlayerPanel { id:playerPanel;open: searching ? false : true}
}



