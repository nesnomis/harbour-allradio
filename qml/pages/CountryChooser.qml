import QtQuick 2.0
import Sailfish.Silica 1.0
import "../stations"

Page {
    id: countryPage
    allowedOrientations: Orientation.All

    SilicaGridView {
        id: grid
        visible: true
        anchors.fill: parent
        clip: true
        quickScroll: false

        cellWidth: width / 2
        cellHeight: width / 2

        property int retning: 0

        onContentYChanged: {
            if (!showPlayer && atYBeginning) showPlayer = true
        }
        onMovementStarted: {
                retning = contentY
        }
        onVerticalVelocityChanged: {
            if (showPlayer && contentY > retning+10 || atYEnd) showPlayer = false; else if (!showPlayer && contentY < retning-10 && !atYEnd) showPlayer = true;

        }
        onMovementEnded: {
                //console.log("verticalVolocity: "+verticalVelocity+" - contentY: "+contentY)
        }

        model: countryModel

        header: BackgroundItem {
            id: favHeader
            width: parent.width
            height: parent.width / 2.3
            onClicked: {
                ctitle = qsTr("Favorites")
                favorites = true
                filter = ""
                key = "title"
                //showSearch = false
                window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),
                                             {model: dbModel} )
            }

                Image {
                    id: favIcon
                    anchors { right: parent.right; rightMargin: 40; verticalCenter: parent.verticalCenter }
                    source: "../harbour-allradio.png"
                    x: 70
                    y: 70
                    width: favHeader.width / 3.7
                    height: favHeader.width / 3.7
                    opacity: 0.6
                    fillMode: Image.PreserveAspectFit
                }

                Label {
                    anchors { left: parent.left; leftMargin: 40; bottom: favIcon.bottom }
                    text: qsTr("Favorites")
                    color: highlighted ? Theme.highlightColor : Theme.primaryColor
                    font.pixelSize: Theme.fontSizeHuge
                }

            }

        delegate: BackgroundItem {
                    width: (parent.width / 2); height: (parent.width / 2)

                    Image {
                        id: myIcon
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "../stations/"+coid+".png"
                        width: parent.width / 1.5
                        height: parent.width / 1.5
                        opacity: 0.6
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter }
                        text: grid.model.countryname(index)
                        color: highlighted ? Theme.highlightColor : Theme.primaryColor
                        font.pixelSize: Theme.fontSizeLarge

                    }

                    onClicked: {
                        favorites = false
                        ctitle = list.model.countryname(index)
                        country = coid
                        filter = ""
                        key = "title"
                        //showSearch = false
                        window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"))
                    }
                }
        PullMenu {
            MenuItem {
                text: qsTr("Show as list")
                onClicked: grid.visible = false
            }
        }
        ScrollDecorator {}
    }

    SilicaListView {
        id: list
        visible: !grid.visible
        anchors.fill: parent
        anchors.bottomMargin: playerPanel.visibleSize
        clip: true
        quickScroll: false


        property int retning: 0

        onContentYChanged: {
            if (!showPlayer && atYBeginning) showPlayer = true
        }
        onMovementStarted: {
            retning = contentY
        }
        onVerticalVelocityChanged: {
            if (showPlayer && contentY > retning+10) showPlayer = false; else if (!showPlayer && contentY < retning-10) showPlayer = true;
        }
        onMovementEnded: {
                //console.log("verticalVolocity: "+verticalVelocity+" - contentY: "+contentY)
        }

        model: countryModel

        header: BackgroundItem {
            id: listfavHeader
            width: parent.width
            height: parent.width / 2.3
            onClicked: {
                ctitle = qsTr("Favorites")
                favorites = true
                filter = ""
                key = "title"
                window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),
                                             {model: dbModel} )
            }
            Image {
                id: favIcon
                anchors { right: parent.right; rightMargin: 40; verticalCenter: parent.verticalCenter }
                source: "../harbour-allradio.png"
                x: 70
                y: 70
                width: listfavHeader.width / 3.7
                height: listfavHeader.width / 3.7
                opacity: 0.6
                fillMode: Image.PreserveAspectFit
            }

            Label {
                anchors { left: parent.left; leftMargin: 40; bottom: favIcon.bottom }
                text: qsTr("Favorites")
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
                font.pixelSize: Theme.fontSizeHuge

            }
        }

        delegate: BackgroundItem {
            width: (parent.width)
            anchors { horizontalCenter: parent.horizontalCenter}

            Image {
                id: myListIcon
                y: 20; //anchors.horizontalCenter: parent.horizontalCenter
                anchors { right: parent.right; rightMargin: 40; verticalCenter: parent.verticalCenter }
                source: "../stations/"+coid+".png"
                height: listText.height
                opacity: 0.6
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: listText
                anchors { left: parent.left; leftMargin: 40; verticalCenter: parent.verticalCenter }
                text: list.model.countryname(index)
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
                font.pixelSize: Theme.fontSizeLarge

            }

            onClicked: {
                favorites = false
                ctitle = list.model.countryname(index)
                country = coid
                filter = ""
                key = "title"
                window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"))
            }
        }
        ScrollDecorator {}
        PullMenu {
            MenuItem {
                text: qsTr("Show as grid")
                onClicked: grid.visible = true
            }
        }
    }
    PlayerPanel {id:playerPanel}
}
