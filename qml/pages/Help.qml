import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: header.height + text.height + Theme.paddingLarge
        contentWidth: parent.width
        VerticalScrollDecorator {}
            PageHeader {
                id: header
                title: qsTr("Help")
            }

            Text {
                id: text
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                    leftMargin: 20
                    rightMargin: 20
                    topMargin: 40
                }

                width: parent.width
                wrapMode: Text.WordWrap
                color: Theme.primaryColor
                linkColor: Theme.highlightColor
                onLinkActivated: remorse.execute(qsTr("Opening webpage"), function() {Qt.openUrlExternally(link)}, 3000)
                textFormat: Text.StyledText
                font.pixelSize: Theme.fontSizeMedium
                //horizontalAlignment: Text.AlignHCenter
                text: "<h2>" + qsTr("Basics") + "</h2>"
                      + qsTr("Choose country by clicking the flag/name, then click the channel you want to listen to") + ".

                <p><br>" + qsTr("When playing you will see the name and country-flag of the current playing radio station at the bottom of the screen.")+"</p><br><p>"+
                qsTr("You can change the country selection between list and icons by flicking down and select 'show as list' alt. 'show as grid'") + "</p>

                <h2>"+qsTr("Searching")+"</h2><p>"+

                qsTr("When you have clicked on the country and are in the channels page, you can click the looking-glass at the top of the list to
                search/filter the selection based on channel name.")+"</p>

                <h2>"+qsTr("Sleeptimer")+"</h2><p>"

                +qsTr("Flick down and select sleeptimer, then set the time in minutes until you want the radio to stop playing")+".</p><br><h2>More</h2><p>"+
                qsTr("This help is a draft! It may be updated?! :-)")+"</p>"



            }
    }



}
