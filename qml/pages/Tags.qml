import QtQuick 2.0
import Sailfish.Silica 1.0
import "../JSONListModel"

Page {
    width: parent.width
    height: parent.height

    JSONListModel {
        id: getTags
        source: "http://www.radio-browser.info/webservice/json/tags"
        query: "$[?(@.stationcount>4)]"
    }

    SilicaFlickable {
        anchors.fill: parent
        anchors.bottomMargin: playerPanel.visibleSize
        contentWidth: parent.width;
        contentHeight: flow.childrenRect.height + Theme.paddingLarge
        clip: true
        ScrollDecorator {}

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

        Flow {
            id: flow
            anchors.fill: parent
            anchors.margins: Theme.paddingLarge
            spacing: Theme.paddingLarge

            Repeater {
                id: elements
                model: getTags.model
                Text {
                    id: tagtext
                    text: model.value;

                    font.pixelSize: {
                        Theme.fontSizeHuge
                        if (model.stationcount < 5) Theme.fontSizeExtraSmall;
                        else if (5 <= model.stationcount &&  model.stationcount < 10) Theme.fontSizeSmall;
                        else if (10 <= model.stationcount &&  model.stationcount < 18) Theme.fontSizeMedium;
                        else if (18 <= model.stationcount &&  model.stationcount < 37) Theme.fontSizeLarge;
                        else if (37 <= model.stationcount &&  model.stationcount < 65) Theme.fontSizeExtraLarge;
                        else Theme.fontSizeHuge;
                    }

                    color: Theme.primaryColor
                    MouseArea {
                        id: m
                        anchors.fill: parent
                        onPressedChanged: pressed ? tagtext.color = Theme.highlightColor : tagtext.color = Theme.primaryColor
                        onClicked: window.pageStack.push(Qt.resolvedUrl("Search.qml"),
                                                                    {searchterm: model.value,searchby: "bytag"})
                    }
                }
            }
        }
        PullMenu {
            MenuItem {
                text: qsTr("Search by name")
                onClicked: window.pageStack.replace(Qt.resolvedUrl("Search.qml"),
                                                 {searchby: "byname"})
            }
        }
    }
    PlayerPanel { id:playerPanel}

}
