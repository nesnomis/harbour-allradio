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
               anchors.leftMargin: Theme.paddingLarge
               source: if (section.search(".png")>0) "https://raw.githubusercontent.com/nesnomis/allradio-data/master/images/"+section+".png"; else "https://raw.githubusercontent.com/nesnomis/allradio-data/master/images/"+section+".png";
            }


            Text {
                 id: showName
                 text: findCountry(section)
                 color: highlighted ? Theme.highlightColor : Theme.primaryColor
                 anchors.leftMargin: Theme.paddingLarge
                 anchors.rightMargin: Theme.paddingMedium
                 anchors.left: countryIcon.right
                 anchors.right: nextIcon.left
                 anchors.verticalCenter: showRect.verticalCenter
                 wrapMode: Text.ElideRight
                 font.pixelSize: Theme.fontSizeLarge
                 font.capitalization: Font.Capitalize
                 maximumLineCount: 1
            }

            onClicked: {
                favorites = false
                ctitle = showName.text
                country = section
                filter = ""
                key = "title"
                window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"))
            }
        }


        header: PageHeader {
            id: pHeader
            //title: favorites ? ctitle : ""

              /*  SearchField {
                    id: searchField
                    width: parent.width - logo2.width - (Theme.paddingMedium * 2 )
                    placeholderText: "Search"
                    inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhNoPredictiveText
                    EnterKey.iconSource: "image://theme/icon-m-enter-close"
                    EnterKey.onClicked: {focus = false;searching= false}
                    focus: true
                    onTextChanged: if (text.length > 0) filter = text; else {filter = "";focus=true;}
                    onClicked: {listView.currentIndex = -1;showPlayer = false;searching=true}
                }*/

                Label {
                     id: title
                     text: qsTr("My Favorites")
                     color: Theme.highlightColor
                     anchors.left: parent.left
                     anchors.right: logo2.left
                     anchors.leftMargin: Theme.paddingMedium
                     anchors.rightMargin: Theme.paddingMedium
                     anchors.verticalCenter: parent.verticalCenter
                     font.pixelSize: Theme.fontSizeExtraLarge
                 }

                Image {
                    id: logo2
                    height: parent.height / 2
                    fillMode: Image.PreserveAspectFit
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: Theme.paddingMedium
                    source: "../harbour-allradio.png"
                }
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
                if (icon.search(".png")>0) picon = icon.toLowerCase(); // The old save in database
                else picon = "https://raw.githubusercontent.com/nesnomis/allradio-data/master/images/"+icon+".png"; // else picon = "https://raw.githubusercontent.com/nesnomis/allradio-data/master/images/"+country+".png"
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
                         if (icon.search(".png")>0) picon = icon.toLowerCase(); // The old save in database
                         else  picon = "https://raw.githubusercontent.com/nesnomis/allradio-data/master/images/"+icon+".png"; /// else picon = "https://raw.githubusercontent.com/nesnomis/allradio-data/master/images/"+country+".png"
                         website = (Qt.resolvedUrl(site))
                     }
                 }

                 MenuItem {
                     id:mdelete
                     //visible: favorites
                     text: qsTr("Delete favourite")

                     onClicked: remove()//listView.currentItem.remove(rpindex,rpsource) //listView.remorseAction();
                     //remorse.execute(qsTr("Deleting channel"), function() {delDb(rpsource)}, 5000);
                 }
             }

            }
            PullMenu {
                MenuItem {
                    text: qsTr("Browse all countries")
                    onClicked: pageStack.push(Qt.resolvedUrl("CountryChooser.qml"))
                }
            }
    }

    ViewPlaceholder {
        enabled: listView.count === 0 //|| jsonModel1.jsonready
        text: qsTr("Favorites empty")
        hintText: qsTr("click here to add some favorites")

        Image {
            id: logo
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.top
            anchors.bottomMargin: Theme.paddingLarge
            opacity: 0.4
            source: "../harbour-allradio.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: pageStack.push(Qt.resolvedUrl("CountryChooser.qml"))
        }
    }

    PlayerPanel { id:playerPanel }
}

