import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property var textAlignment: TextInput.AlignLeft
    allowedOrientations: Orientation.All

    RemorsePopup {id: remorse}

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: header.height + text.height + logo.height + Theme.paddingLarge
        contentWidth: parent.width
        VerticalScrollDecorator {}
            PageHeader {
                id: header
                title: qsTr("About AllRadio")
            }

            Image {
               id: logo
               source: "../harbour-allradio.png"
               anchors.top: header.bottom
               anchors.topMargin: 40
               anchors.horizontalCenter: parent.horizontalCenter
               opacity: 0.6
               fillMode: Image.PreserveAspectFit
             }

            Text {
                id: text
                anchors {
                    top: logo.bottom
                    left: parent.left
                    right: parent.right
                    leftMargin: 20
                    rightMargin: 20
                }
                width: parent.width
                wrapMode: Text.WordWrap
                color: Theme.primaryColor
                linkColor: Theme.highlightColor
                onLinkActivated: remorse.execute(qsTr("Opening webpage"), function() {Qt.openUrlExternally(link)}, 3000)
                textFormat: Text.StyledText
                //readOnly: true
                font.pixelSize: Theme.fontSizeMedium
                horizontalAlignment: Text.AlignHCenter
                text: "<h2>AllRadio v1.2.2</h2>
                       <p>Copyright/left 2015 - Niels Simonsen <nesnomis@gmail.com>.</p>
                        <p><a href='http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt'>License GPL v2.0</a></p><br><p>"



                      + qsTr("Sourcecode is available on") + ": <a href='https://github.com/nesnomis/harbour-allradio'>github</a>.</p><br><p>"
                     + qsTr("The radiostations are from") + ": <a href='http://www.listenlive.eu'>listenlive.eu</a>.</p><br><p>

                        "
            }
    }
}
