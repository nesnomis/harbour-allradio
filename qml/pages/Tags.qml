import QtQuick 2.0
import Sailfish.Silica 1.0
import "../JSONListModel"

Page {
    width: parent.width
    height: parent.height
    property int stcount: 6

    JSONListModel {
        id: getTags
        source: "http://www.radio-browser.info/webservice/json/tags"
        query: "$[?(@.stationcount>"+stcount+")]"
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


            PageHeader {
                        id: pHeader
                        title: qsTr("Most popular tags")
                    }

        Flow {
            id: flow
            anchors.top: pHeader.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: Theme.paddingLarge
            spacing: Theme.paddingLarge

            Repeater {
                id: elements
                model: getTags.model
                Text {
                    id: tagtext
                    text: model.value;

                    font.pixelSize: (model.stationcount / 330) * (Theme.fontSizeHuge - Theme.fontSizeSmall) + Theme.fontSizeSmall

                    color: {
                        if (font.pointSize < Theme.fontSizeExtraSmall) Theme.secondaryColor;
                        else if (font.pointSize >= Theme.fontSizeExtraSmall) Theme.primaryColor
                    }

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
                                                 {searchby: "byname",searchtitle: qsTr("Search by name")})
            }
        }
    }
    PlayerPanel { id:playerPanel}

}
