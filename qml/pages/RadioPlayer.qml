import QtQuick 2.1
import Sailfish.Silica 1.0

Page {
    id: radioPage
    allowedOrientations: Orientation.All
    property alias model: listView.model

    function open() {
        remorse.execute("Opening webpage", function() {Qt.openUrlExternally(website)}, 3000)
                 }

    RemorsePopup {}
    ControlPanel { id:playerPanel }

    Timer {
        id: sleepTimer
        interval: 60000
        repeat: false
        onTriggered: (sleepTime == 0) ? stopStream() : sleepTime = (sleepTime - 1)
        running: sleepTime >= 0
    }


    Component {
        id: sleepTimerPage
        Page {

            allowedOrientations: Orientation.All

            SilicaFlickable {
                anchors.fill: parent
                contentHeight: column.height + Theme.paddingLarge

                VerticalScrollDecorator {}

                Column {
                    id: column
                    spacing: Theme.paddingLarge
                    width: parent.width
                    anchors.horizontalCenter: parent.Center
                    PageHeader { title: "Sleeptimer Status" }
                    Label {
                        text: ((sleepTime > 0) ? ("Remaning time: "  + sleepTime + ". change time") : "choose time")
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: Theme.highlightColor
                        font.family: Theme.fontFamilyHeading
                    }
                    Slider {
                        id: timerSlider
                        value: 60
                        minimumValue: 1
                        maximumValue: 120
                        stepSize: 1
                        width: parent.width
                        handleVisible: true
                        valueText: value //(value >= 0) ? value : "0"
                        label: "minutes"
                    }

                    Row {
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: Theme.paddingLarge

                        Button {
                                anchors.horizontalCenter: parent
                                text: "Start"
                                onPressed: sleepTime = timerSlider.value
                            }
                        Button {
                                anchors.horizontalCenter: parent
                                text: "Stop"
                                onPressed: sleepTime = -1
                            }
                    }

                }
            }
        }

    }

    SilicaListView {
        VerticalScrollDecorator {}
        id: listView
        clip: true

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            bottomMargin: playerPanel.visibleSize
        }

        model: fiModel

        PullDownMenu {
            MenuItem {
                text: qsTr("Sleeptimer") //Sleep timer
                onClicked: pageStack.push(sleepTimerPage)
            }

        }

        header: PageHeader { title: ctitle } //Radio stations

        section {
            property: 'section'
            delegate: SectionHeader {
                text: section
            }
        }

        delegate: BackgroundItem {
            width: listView.width
            Label {
                id: firstName
                text: title
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
                anchors.verticalCenter: parent.verticalCenter
                x: Theme.paddingLarge
            }
            onClicked: {musicSource = (Qt.resolvedUrl(source))
                radioStation = title
                playStream()
                website = (Qt.resolvedUrl(site))
            }
        }
    }
}



