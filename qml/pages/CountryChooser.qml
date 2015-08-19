import QtQuick 2.1
import Sailfish.Silica 1.0

Page {
    id: countryPage
    allowedOrientations: Orientation.All

    ListModel {
        id: galleryModel

        ListElement {
            country: "Danish radio"
            stations: "dk"
            icon: "../Denmark.png"
        }
        ListElement {
            country: "Swedish radio"
            stations: "sv"
            icon: "../Sweden.png"
        }
        ListElement {
            country: "Norway radio"
            stations: "no"
            icon: "../Norway.png"
        }
        ListElement {
            country: "Finnish radio"
            stations: "fi"
            icon: "../Finland.png"
        }
    }

    ControlPanel { id:playerPanel }

    SilicaGridView {
        id: grid
        cellWidth: width / 2
        cellHeight: width / 2
        anchors.fill: parent

        anchors.bottomMargin: playerPanel.visibleSize

        model: galleryModel

        PullDownMenu {
            MenuItem {
                text: qsTr("About application") //About
                onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
            }
            MenuItem {
                text: qsTr("Help") //Help
                onClicked: pageStack.push(Qt.resolvedUrl("Help.qml"))
            }

        }

        header: PageHeader { title: "Choose country" }

        delegate: Item {
                    width: (parent.width / 2); height: 300

                    Image {
                        id: myIcon
                        y: 20; anchors.horizontalCenter: parent.horizontalCenter
                        source: icon
                        width: parent.width / 1.5
                        height: parent.width / 1.5
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter }
                        text: country
                        color: Theme.highlightColor

                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            cicon = icon
                            ctitle = country
                            if (stations == "dk" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),
                                                                             {model: dkModel} )
                            if (stations == "sv" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),
                                                                             {model: svModel} )
                            if (stations == "no" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),
                                                                             {model: noModel} )
                            if (stations == "fi" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),
                                                                             {model: noModel} )
                        }
                    }
                }
        ScrollDecorator {}
    }
}
