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
               source: if (section == "0") "../allradio-data/images/allradio.png"; else if (section.search(".png")>0) "../allradio-data/images/"+section+".png"; else "../allradio-data/images/"+section+".png";
            }

            Text {
                 id: showName
                 text: section === "0" ? qsTr("My radio stations") : findCountry(section)
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
                key = "title"
                window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"))
                }
            }
        }


        header: PageHeader {
            id: pHeader
            title: qsTr("Favorites")
        }

        VerticalScrollDecorator {}

        property int retning: 0
        onContentYChanged: {
            if (atYBeginning) showPlayer = true
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
            height: menuOpen ? contextMenu.height + contentItem.height : contentItem.height

            function remove() {
                remorseAction("Deleting", function() { delDb(source);listView.model.remove(index) })
            }

            Label {
                 id: firstName
                 text: model.title
                 color: highlighted ? Theme.highlightColor : Theme.primaryColor
                 anchors.left: parent.left
                 anchors.right: parent.right
                 anchors.leftMargin: Theme.paddingMedium
                 anchors.rightMargin: Theme.paddingMedium
                 anchors.verticalCenter: parent.verticalCenter
                 font.pixelSize: Theme.fontSizeMedium
             }

            onClicked: {
                ps(source)
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
                         ps(source)
                         radioStation = title
                         if (icon == "0") picon = "../allradio-data/images/allradio.png"
                         else if (icon.search(".png")>0) picon = icon.toLowerCase(); // The old save in database
                         else  picon = "../allradio-data/images/"+icon+".png"; /// else picon = "../allradio-data/images/"+country+".png"
                         website = (Qt.resolvedUrl(site))
                     }
                 }

                 MenuItem {
                     id:medit
                     visible: icon == "0" ? true : false
                     text: qsTr("Edit")

                     onClicked: window.pageStack.push(Qt.resolvedUrl("AddOwnRadio.qml"),
                                                      {infotext: qsTr("Edit radio station"),titlfield: title,streamurlfield: source,homepagefield: site,sectionfield: section})
                 }

                 MenuItem {
                     id:mdelete
                     text: qsTr("Delete")

                     onClicked: remove()//listView.currentItem.remove(rpindex,rpsource) //listView.remorseAction();
                 }
             }

            }
            PullMenu {
                MenuItem {
                    text: qsTr("Add radio stations")
                    onClicked: pageStack.push(Qt.resolvedUrl("CountryChooser.qml"))
                }
            }
    }

    ViewPlaceholder {
        enabled: listView.count === 0 //|| jsonModel1.jsonready
        text: qsTr("Favorites empty")
        hintText: qsTr("click here to add some favorites")
        textFormat: Text.StyledText

        MouseArea {
            anchors.fill: parent
            onClicked: pageStack.push(Qt.resolvedUrl("CountryChooser.qml"))
        }
    }

    PlayerPanel { id:playerPanel }
}

