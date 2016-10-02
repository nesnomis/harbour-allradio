import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    //allowedOrientations: Orientation.All

    RemorsePopup {id: remorse}

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: header.height + text.height + logo.height + log.height + donate.height + sep2.height + Theme.paddingLarge
        contentWidth: parent.width
        VerticalScrollDecorator {}
            PageHeader {
                id: header
                title: qsTr("About AllRadio")
            }

            Row {
                id: logorow
                anchors.top: header.bottom
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: Theme.paddingLarge
            Image {
               id: logo
               source: "../harbour-allradio.png"
               opacity: 0.6
               fillMode: Image.PreserveAspectFit
             }
            Label {
                text: "AllRadio v"+Qt.application.version
                font.pixelSize: Theme.fontSizeHuge
                font.bold: true
            }
            }
            Text {
                id: text
                anchors {
                    top: logorow.bottom
                    left: parent.left
                    right: parent.right
                    leftMargin: 20
                    rightMargin: 20
                }
                //width: parent.width
                wrapMode: Text.WordWrap
                color: Theme.primaryColor
                linkColor: Theme.highlightColor
                onLinkActivated: remorse.execute(qsTr("Opening webpage"), function() {Qt.openUrlExternally(link)}, 3000)
                textFormat: Text.StyledText
                font.pixelSize: Theme.fontSizeMedium
                horizontalAlignment: Text.AlignHCenter
                text: "
                       <p>Copyright 2015-2016 - Niels Simonsen</p>
                        <p>License: <a href='http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt'>GPL v2.0</a><br>"
                      + qsTr("Sourcecode is available on") + ": <a href='https://github.com/nesnomis/harbour-allradio'>github</a><br><p>"
                     + qsTr("The radiostations are from") + ": <br><a href='http://www.radio-browser.info/'>Community Radio Browser</a></p>"
            }

        /*        Separator {
                    id:sep1
                    anchors.top: text.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Theme.highlightColor
                    width: parent.width - (Theme.paddingMedium * 2)

                    //alignment: Qt.AlignHCenter
                    }


                Label {
                     id: info
                     text: "Change your prefered radio station source (the new Community Radio Browser is recommended):"
                     color: Theme.highlightColor
                     anchors.left: activationSwitch.left
                     anchors.right: activationSwitch.right
                     anchors.leftMargin: Theme.paddingMedium
                     anchors.top: sep1.bottom
                     anchors.topMargin: Theme.paddingLarge
                     wrapMode: Text.Wrap
                     maximumLineCount: 3
                     font.pixelSize: Theme.fontSizeMedium
                 }

                Row {
                    id: activationSwitch
                    anchors.top: info.bottom
                    anchors.topMargin: Theme.paddingMedium
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: Theme.paddingLarge

                    Button {
                        id: butt1
                        down: internal ? false : true
                       text: "Community Radio"
                       onClicked: internal = false
                    }

                    Button {
                        id: butt2
                        down: internal ? true : false
                       text: "Listenlive.eu"
                       onClicked: internal = true
                    }
                } */

                Separator {
                    id:sep2
                    anchors.top: text.bottom
                    anchors.topMargin: Theme.paddingLarge
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Theme.highlightColor
                    width: parent.width - (Theme.paddingMedium * 2)
                }

                Text {
                    id: donate
                    anchors {
                        top: sep2.bottom
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
                    font.pixelSize: Theme.fontSizeSmall
                    horizontalAlignment: Text.AlignHCenter
                    text: "<p>"+qsTr("If you like this app, and would like to make a donation (for a beer or a cup of coffee?! :) ..):")+
                          "</p><br><p><h3><a href='https://flattr.com/thing/4552590/AllRadio'>flattr</a> ------ or ------ <a href='https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=9KAZFTA26THEG'>PayPal</a></h3></p>"
                }

                Separator {
                    id:sep3
                    anchors.top: donate.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Theme.highlightColor
                    width: parent.width - (Theme.paddingMedium * 2)
                }

                Text {
                    id: log
                    anchors {
                        top: sep3.bottom
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
                    text: "<h2>Changelog:</h2><br>"+


"<p>version 1.5.0<br>
- Added global search by tag<br>
- added global search by name<br>
- Lots of tweaking</p>
<p>version 1.4.9<br>
- Experimental version<br>
- Switched radio source from internal (listenlive.eu) to external (Community Radio Browser)</p>
<p>version 1.4.7<br>
- Swedish translation corrected (by eson57)</p>
<p>version 1.4.6<br>
- Same as 1.4.5 + MPRIS for openrepos version</p>
<p>version 1.4.5<br>
- First step in a bigger update done.<br>
- Changed initial page to favorites with direct link to favorite countries.<br>
- Added radiostation metadata (if available).<br>
- Tweaking the look and feel a bit.</p>
<p>version 1.4.4<br>
- openrepos (MPRIS version)</p>
<p>version 1.4.3<br>
- Fixed an unforseen bug/feature in script not allowing some stations to
be played (such as Mdr Sachen Anhalt, Germany and probably more!?).
Thank you <b>Blaubear1833</b> for making me aware of that!<br>
- Corrected some swedish translations. Thank you <b>eson57</b>!</p>
<p>version 1.4.2<br>
- Added lockscreencontrol (MPRIS) for openRepos version<br>
<p>version 1.4.1<br>
- Change in player (stability/speed)<br>
- Added more columns in landscape mode<br>
- Changed the the searchfunction (searchfield)
</p>
<p>version 1.3.6<br>
- Added flags (They were accidentally left out in version 1.3.5)
</p>
<p>version 1.3.5<br>
- Tiny update to fix sleeptimer in Sailfishos 2.0
</p>
<p>version 1.3.4<br>
- Tweaking Error handling<br>
- Tweaking deletion of favorites<br>
- Small fix on sleeptimer
</p>

<p>version 1.3.3<br>
- found another error (country flags)<br>
- NEED TO DO SOME BETTER TESTING!!!</p>

<p>version 1.3.2<br>
- Corrected a fatal error when reading country flag from favorites!</p>

<p>version 1.3.1<br>
- Updated about page</p>

<p>version 1.3.0<br>
- Corrected a typing error in sleeptimer<br>
- Tweaked coverpage<br>
- Added changelog to about page</p>

<p>version 1.2.9<br>
- Making sure it behaves on incoming call</p>

<p>version 1.2.8<br>
- just a rebuild.</p>

<p>version 1.2.7<br>
- Able to resume play after sleeptimer stopped.</p>

<p>version 1.2.6<br>
- Detect earphones disconnection and set icon to pause<br>
- If clicking on current playing stream, it now reloads and start stream again (instead of doing nothing).<br>
- fixing playerPanel behavior when scrolling to the bottom of the list (it should get out of the way!).<br>
- Introducing new unforeseen bugs (features)!? :) </p>

<p>version 1.2.5<br>
- Fixed a bug making a lot of wake ups when idle (thank you Jolla for pointing that out!).<br>
- Added Search/Filter on channels<br>
- Changed the player internally to handle and show errors in a better way.<br>
- Maybe a little more?!</p>

<p>version 1.2.4<br>
- Fixed a bug (country not showing)<br>
- Sort order by title (all channels)</p>

<p>version 1.2.3<br>
- Sort order by title (favorites)</p>

<p>version 1.2.2:<br>
- Major rewrite to prepare for filter search and sorting.<br>
- Some more tweaking of appearance.</p>

<p>version 1.2.1:<br>
- Added Kosovo.<br>
- Changed look on flags (Switzerland and Vatican).<br>
- Changed Player behavior (hopefully looks and works nicer).<br>
- Small tweaks here and there... :)<br>
- Search and sort will have to wait (sorry).</p>

<p>Initial release 1.2</p>"
                }
    }
}
