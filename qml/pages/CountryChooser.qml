import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: countryPage

    SilicaGridView {
        id: grid
        visible: true
        anchors.fill: parent
        clip: true

        cellWidth: isPortrait ? width / 2 : width / 3
        cellHeight: isPortrait ? width / 2 : width / 3

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

        header: PageHeader {
            //id: pheader
            title: qsTr("Countries")
            }

        delegate: BackgroundItem {
            width: isPortrait ? parent.width / 2 : parent.width / 3 //(parent.width / 2);
            height: isPortrait ? parent.width / 2 : parent.width / 3

            Image {
                id: myIcon
                anchors.horizontalCenter: parent.horizontalCenter
                source: coid == "0" ? "../allradio-data/images/allradio.png" : "../allradio-data/images/"+coid+".png"
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
                coid == "0" ? window.pageStack.push(Qt.resolvedUrl("AddOwnRadio.qml")) : window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"))
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

        header: PageHeader {
            //id: pheader
            title: qsTr("Countries")
        }

        delegate: BackgroundItem {
            id: favBack
            width: (parent.width)
            anchors { horizontalCenter: parent.horizontalCenter; }

            Image {
                id: myListIcon
                y: 20; //anchors.horizontalCenter: parent.horizontalCenter
                anchors { right: parent.right; rightMargin: Theme.paddingLarge; verticalCenter: parent.verticalCenter }
                source: coid == "0" ? "../allradio-data/images/allradio.png" : "../allradio-data/images/"+coid+".png"
                height: listText.height
                opacity: 0.6
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: listText
                anchors { left: parent.left; leftMargin: Theme.paddingLarge; verticalCenter: parent.verticalCenter }
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
                coid == "0" ? window.pageStack.push(Qt.resolvedUrl("AddOwnRadio.qml")) : window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"))
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
