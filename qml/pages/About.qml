import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property var textAlignment: TextInput.AlignLeft
    allowedOrientations: Orientation.All
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: header.height + text.height + Theme.paddingLarge
        contentWidth: parent.width
        VerticalScrollDecorator {}
            PageHeader {
                id: header
                title: "About AllRadio"
            }

            TextArea {
                id: text
                anchors {
                    top: header.bottom
                    left: parent.left
                    right: parent.right
                    leftMargin: 20
                    rightMargin: 20
                }
                width: parent.width
                wrapMode: Text.WordWrap
                readOnly: true
                font.pixelSize: Theme.fontSizeMedium
                horizontalAlignment: textAlignment
                text: "
AllRadio is a radio player for online streaming radio.

Sourcecode is available on github <https://github.com/nesnomis/harbour-allradio>.

AllRadio is inspired by great apps such as uradio, nettiradio and my own drquick for Nokia N9.

The radiostations are coming from: <http://www.listenlive.eu>.

AllRadio copyright 2015 - Niels Simonsen <nesnomis@gmail.com>."

            }
    }
}
