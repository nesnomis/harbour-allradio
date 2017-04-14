import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: favPage

    SilicaListView {
        id: listView
        anchors.fill: parent
        anchors.bottomMargin: playerPanel.visibleSize
        clip: true

        model: dbModel

        section.property: "icon"
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
               id: nextIcon
               anchors.verticalCenter: showRect.verticalCenter
               anchors.right: showRect.right
               anchors.rightMargin: Theme.paddingMedium
               source: "image://theme/icon-m-right"
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
                 text: findCountry(section.toLowerCase()) //findCountry(section.toLowerCase())
                 color: highlighted ? Theme.highlightColor : Theme.primaryColor
                 anchors.leftMargin: Theme.paddingMedium
                 anchors.rightMargin: Theme.paddingMedium
                 anchors.left: countryIcon.right
                 anchors.right: nextIcon.left
                 anchors.verticalCenter: showRect.verticalCenter
                 wrapMode: Text.ElideRight
                 font.pixelSize: Theme.fontSizeLarge
                 font.capitalization: section == "0" ? Font.MixedCase : Font.Capitalize
                 maximumLineCount: 1
            }

            onClicked: {
                if (section == "0") {
                    window.pageStack.push(Qt.resolvedUrl("AddOwnRadio.qml"))
                } else {
                    favorites = false
                    ctitle = showName.text
                    country = section
                    filter = ""
                    key = internal ? "title" : "name"
                    window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"))
                }
            }
        }

        header: PageHeader {
            id: pHeader
            title: qsTr("Favorites")
            description: qsTr("Find radio stations")

            Image {
               id: logo
               height: parent.height / 2
               //visible: streaming && currentid == model.id ? true : false
               fillMode: Image.PreserveAspectFit
               anchors.verticalCenter: parent.verticalCenter
               anchors.left: parent.left
               anchors.leftMargin: Theme.paddingLarge
               source: "../harbour-allradio.png"
            }
        }

        VerticalScrollDecorator {}

        property int retning: 0
        onContentYChanged: {
            if (atYBeginning) showPlayer = true
            if (atYEnd) showPlayer = false
            }
            onMovementStarted: {
                retning = contentY
            }
            onVerticalVelocityChanged: {
                if (contentY > retning+10) showPlayer = false; else if (contentY < retning-10) showPlayer = true;
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
                   anchors.left: parent.left
                   anchors.leftMargin: Theme.paddingMedium
                   source: streaming && currentid == model.id ? "image://theme/icon-m-speaker?" + Theme.highlightColor : ""
                }

                Column {
                    anchors.left: speakerIcon.right
                    anchors.right: codlabel.visible ? codlabel.left : bit.left
                    anchors.leftMargin: Theme.paddingMedium
                    anchors.rightMargin: Theme.paddingMedium
                    anchors.verticalCenter: parent.verticalCenter

                    Label {
                         id: firstName
                         text: title
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
                     text: model.codec ? codec == "UNKNOWN" ? "" : codec : ""     // internal ? "" : codec == "UNKNOWN" ? "" : codec
                     visible: model.id > 0 ? true : false
                     color: highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
                     anchors.verticalCenter: parent.verticalCenter
                     anchors.right: bit.left
                     anchors.rightMargin: Theme.paddingMedium
                     font.pixelSize: Theme.fontSizeSmall
                     font.italic: true
                 }

                Label {
                     id: bit
                     text: model.id == 0 ? "old" : bitrate == 0 && codec == "UNKNOWN" ? "UNKNOWN" : bitrate == 0 ? "" : bitrate   // bitrate == 0 && codec == "UNKNOWN" ? "UNKNOWN" : bitrate == 0 ? "" : bitrate
                     color: highlighted ? Theme.secondaryHighlightColor : Theme.secondaryColor
                     anchors.right: parent.right
                     anchors.rightMargin: Theme.paddingMedium
                     anchors.verticalCenter: parent.verticalCenter
                     font.pixelSize: Theme.fontSizeSmall
                     font.italic: true
                 }

                onClicked: {
                    internal ? ps(source) : model.id == 0 ? ps(source) : cps(model.id)
                    radioStation = title
                    if (icon == "0") picon = "../allradio-data/images/allradio.png"
                    else if (icon.search(".png")>0) picon = icon.toLowerCase(); // The old save in database
                    else picon = "../allradio-data/images/"+icon+".png"; // else picon = "../allradio-data/images/"+country+".png"
                    website = (Qt.resolvedUrl(site))
                }

                 ContextMenu {
                     id: contextMenu

                     MenuItem {
                         id:mlisten
                         visible: true
                         text: qsTr("Listen")
                         onClicked: {
                             internal ? ps(source) : model.id == 0 ? ps(source) : cps(model.id)
                             radioStation = title
                             if (icon == "0") picon = "../allradio-data/images/allradio.png"
                             else if (icon.search(".png")>0) picon = icon.toLowerCase(); // The old save in database
                             else  picon = "../allradio-data/images/"+icon+".png";
                             website = (Qt.resolvedUrl(site))
                         }
                     }

                 /*    MenuItem {
                         id:mauto
                         visible: true
                         text: qsTr("Auto play on start")
                         onClicked: {
                             //internal ? ps(source) : model.id == 0 ? ps(source) : cps(model.id)
                             //radioStation = title
                             //if (icon == "0") picon = "../allradio-data/images/allradio.png"
                             //else if (icon.search(".png")>0) picon = icon.toLowerCase(); // The old save in database
                             //else  picon = "../allradio-data/images/"+icon+".png";
                             //website = (Qt.resolvedUrl(site))
                         }
                     } */

                     MenuItem {
                         id:medit
                         visible: icon == "0" ? true : false
                         text: qsTr("Edit")

                         onClicked: window.pageStack.push(Qt.resolvedUrl("AddOwnRadio.qml"),
                                                          {infotext: qsTr("Edit radio station"),titlfield: title,streamurlfield: source,homepagefield: site,sectionfield: section,oldsource: source})
                     }

                     MenuItem {
                         id:mdelete
                         text: qsTr("Delete")

                         onClicked: remove()//listView.currentItem.remove(rpindex,rpsource) //listView.remorseAction();
                     }

                     MenuItem {
                         id:msearch
                         visible: id == 0 ? true : false
                         text: qsTr("Search and replace")

                         onClicked: window.pageStack.push(Qt.resolvedUrl("Search.qml"),
                                                          {searchterm: model.title,oldsource: source,searchby: "byname"})
                     }
                 }
            }

            ViewPlaceholder {
                enabled: listView.count <= 0 && allready == true //|| jsonModel1.jsonready
                text: qsTr("Favorites empty")
                hintText: qsTr("click here to add some favorites")
                textFormat: Text.StyledText
            }
            MouseArea {
                enabled: listView.count == 0
                anchors.fill: parent
                onClicked: pageStack.push(Qt.resolvedUrl("CountryChooser.qml"))
            }

            PullMenu {
        /*        MenuItem {
                    text: qsTr("Add radio station")
                    onClicked: pageStack.push(Qt.resolvedUrl("AddOwnRadio.qml"))
                } */
                MenuItem {
                    text: qsTr("Find radio stations")
                    onClicked: pageStack.push(pageStack.nextPage())
                }
            }
    }
    onStatusChanged: {
        if (status === PageStatus.Active && pageStack.depth === 1) {pageStack.pushAttached("FindRadio.qml", {});} //FindRadio.qml
    }
    PlayerPanel { id:playerPanel }
}

