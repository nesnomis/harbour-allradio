import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    RemorsePopup {id: remorse}

    SilicaFlickable {
        anchors.fill: parent
        width: parent.width
        height: parent.height
        contentHeight: contentItem.childrenRect.height// header.height + text.height + logo.height + sep1.height + sep2.height + Theme.paddingLarge
        contentWidth: parent.width

        VerticalScrollDecorator {}

        PageHeader {
            id: header
            title: qsTr("About")
        }

        Row {
            id: logorow
            anchors.top: header.bottom
            anchors.topMargin: Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingLarge

            Image {
               id: logo
               source: "../harbour-allradio.png"
               opacity: 0.8
               fillMode: Image.PreserveAspectFit
             }

            Label {
                text: "AllRadio v"+Qt.application.version
                font.pixelSize: Theme.fontSizeExtraLarge
                font.bold: true
            }
        }

        MouseArea {
            anchors.fill: logorow
            onClicked: remorse.execute(qsTr("Opening github"), function() {Qt.openUrlExternally("https://github.com/nesnomis/harbour-allradio")}, 3000)
        }

        Text {
            id: text
            anchors {
                top: logorow.bottom
                topMargin: Theme.paddingLarge
                left: parent.left
                right: parent.right
                leftMargin: 20

                rightMargin: Theme.paddingMedium
            }
            //width: parent.width
            wrapMode: Text.WordWrap
            color: Theme.primaryColor
            linkColor: Theme.highlightColor
            onLinkActivated: remorse.execute(qsTr("Opening webpage"), function() {Qt.openUrlExternally(link)}, 3000)
            textFormat: Text.StyledText
            font.pixelSize: Theme.fontSizeSmall
            horizontalAlignment: Text.AlignHCenter
            text: "Copyright 2015-2017 - Niels Simonsen"
                 /*   <p>License: <a href='http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt'>GPL v2.0</a><br>"
                  + qsTr("Sourcecode is available on") + ": <a href='https://github.com/nesnomis/harbour-allradio'>github</a><br><p>"
                 + qsTr("The radiostations are from") + ": <br><a href='http://www.radio-browser.info/'>Community Radio Browser</a></p>" */
        }

        Separator {
            id:sep1
            anchors.top: text.bottom
            anchors.topMargin: Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.highlightColor
            width: parent.width - (Theme.paddingMedium * 2)
        }

        Label {
            id: gpltext
            anchors.top: sep1.bottom
            anchors.topMargin: Theme.paddingLarge
            anchors.right: parent.right
            anchors.rightMargin: Theme.paddingLarge
            color: Theme.highlightColor
            text: qsTr("AllRadio license")
            font.pixelSize: Theme.fontSizeLarge
            //font.bold: true
        }

        Text {
            id: licenseinfo
            anchors {
                top: gpltext.bottom
                topMargin: Theme.paddingLarge
                left: parent.left
                right: parent.right
                leftMargin: 20

                rightMargin: Theme.paddingMedium
            }
            //width: parent.width
            wrapMode: Text.WordWrap
            color: Theme.primaryColor
            linkColor: Theme.highlightColor
            onLinkActivated: remorse.execute(qsTr("Opening webpage"), function() {Qt.openUrlExternally(link)}, 3000)
            textFormat: Text.StyledText
            font.pixelSize: Theme.fontSizeSmall
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("AllRadio is GPL v.3 with the exception for JSONListModel and ValuePicker wich is licensed under MIT.")
        }

        Row {
            id: gplrow
            anchors.top: licenseinfo.bottom
            anchors.topMargin: Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingLarge * 5

            IconButton {
               icon.source: "../allradio-data/images/gpl3.png"
               onClicked: remorse.execute(qsTr("Opening GPL3"), function() {Qt.openUrlExternally("https://www.gnu.org/licenses/gpl-3.0-standalone.html")}, 3000)
            }

            IconButton {
               icon.source: "../allradio-data/images/mit.png"
               onClicked: remorse.execute(qsTr("Opening MIT"), function() {Qt.openUrlExternally("https://sm.mit-license.org/")}, 3000)
            }

        }

        Separator {
            id:sep2
            anchors.top: gplrow.bottom
            anchors.topMargin: Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.highlightColor
            width: parent.width - (Theme.paddingMedium * 2)
        }

        Label {
            id: community
            anchors.top: sep2.bottom
            anchors.topMargin: Theme.paddingLarge
            anchors.right: parent.right
            anchors.rightMargin: Theme.paddingLarge
            color: Theme.highlightColor
            text: "Community Radio"
            font.pixelSize: Theme.fontSizeLarge
        }

        Row {
            id: communityrow
            anchors.top: community.bottom
            anchors.topMargin: Theme.paddingLarge
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: Theme.paddingLarge
            anchors.rightMargin: Theme.paddingLarge

        Label {
            id: radioinfo
                width: page.width - logo2.width - (Theme.paddingLarge * 2)
                wrapMode: Text.WordWrap
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeMedium
                text: qsTr("AllRadio uses the webservice from Community Radio Browser.")
            }

            Image {
                id: logo2
                fillMode: Image.PreserveAspectFit
                source: "../allradio-data/images/community.png"
            }
        }

        MouseArea {
            anchors.fill: communityrow
            onClicked: remorse.execute(qsTr("Opening Radio Community"), function() {Qt.openUrlExternally("http://www.radio-browser.info/")}, 3000)
        }

        Separator {
            id:sep3
            anchors.top: communityrow.bottom
            anchors.topMargin: Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.highlightColor
            width: parent.width - (Theme.paddingMedium * 2)
        }

        Label {
            id: donatetext
            anchors.top: sep3.bottom
            anchors.topMargin: Theme.paddingLarge
            anchors.right: parent.right
            anchors.rightMargin: Theme.paddingLarge
            color: Theme.highlightColor
            text: qsTr("Donate")
            font.pixelSize: Theme.fontSizeLarge
        }

        Text {
            id: donateinfo
            anchors {
                top: donatetext.bottom
                topMargin: Theme.paddingLarge
                left: parent.left
                right: parent.right
                leftMargin: 20

                rightMargin: Theme.paddingMedium
            }
            wrapMode: Text.WordWrap
            color: Theme.primaryColor
            linkColor: Theme.highlightColor
            onLinkActivated: remorse.execute(qsTr("Opening webpage"), function() {Qt.openUrlExternally(link)}, 3000)
            textFormat: Text.StyledText
            font.pixelSize: Theme.fontSizeSmall
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("If you like this app, and would like to make a donation (for a beer or a cup of coffee?! :) ..)")
        }

        Row {
            id: donaterow
            anchors.top: donateinfo.bottom
            anchors.topMargin: Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingLarge * 5

            IconButton {
               icon.source: "../allradio-data/images/flattr.png"
               onClicked:remorse.execute(qsTr("Opening Flattr"), function() {Qt.openUrlExternally("https://flattr.com/thing/4552590/AllRadio")}, 3000)
            }

            IconButton {
               icon.source: "../allradio-data/images/paypal.png"
               onClicked: remorse.execute(qsTr("Opening Paypal"), function() {Qt.openUrlExternally("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=9KAZFTA26THEG")}, 3000)
            }

        }

        Separator {
            id:sep4
            anchors.top: donaterow.bottom
            anchors.topMargin: Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.highlightColor
            width: parent.width - (Theme.paddingMedium * 2)
        }

        Label {
            id: changelog
            anchors.top: sep4.bottom
            anchors.topMargin: Theme.paddingLarge
            anchors.right: parent.right
            anchors.rightMargin: Theme.paddingLarge
            color: Theme.highlightColor
            text: "Changelog"
            font.pixelSize: Theme.fontSizeLarge
        }

        Text {
            id: log
            anchors {
                top: changelog.bottom
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
            font.pixelSize: 0
            text:

"
<p><b>version 1.5.6</b><br>
- openrepos version with MPRIS<br>
- Same as 1.5.5</p>
<p><b>version 1.5.5</b><br>
- Fixes compatability with Sailfish 2.1.<br>
- Countries updates</p>
<p><b>version 1.5.4</b><br>
- openrepos version with MPRIS<br>
- Same as 1.5.3</p>
<p><b>version 1.5.3</b><br>
- Added Tag info<br>
- Added more options to find radio stations<br>
- A lot of UI tweaking</p>
<p><b>version 1.5.1</b><br>
- More correct tags<br>
- Show current playing in list<br>
- Small twaks<br>
- Added Chinese flag</p>
<p><b>version 1.5.0</b></<br>
- Experimental version<br>
- Switched radio source from internal (listenlive.eu) to external (Community Radio Browser)<br>
- Added global search by tag<br>
- added global search by name<br>
- Lots of tweaking</p>
<p><b>version 1.4.7</b><br>
- Swedish translation corrected (by eson57)</p>
<p><b>version 1.4.6</b><br>
- Same as 1.4.5 + MPRIS for openrepos version</p>
<p><b>version 1.4.5</b><br>
- First step in a bigger update done.<br>
- Changed initial page to favorites with direct link to favorite countries.<br>
- Added radio station metadata (if available).<br>
- Tweaking the look and feel a bit.</p>
<p><b>version 1.4.4</b><br>
- openrepos (MPRIS version)</p>
<p><b>version 1.4.3</b><br>
- Fixed an unforseen bug/feature in script not allowing some stations to
be played (such as Mdr Sachen Anhalt, Germany and probably more!?).
Thank you <b>Blaubear1833</b> for making me aware of that!<br>
- Corrected some swedish translations. Thank you <b>eson57</b>!</p>
<p><b>version 1.4.2</b><br>
- Added lockscreencontrol (MPRIS) for openRepos version<br>
<p><b>version 1.4.1</b><br>
- Change in player (stability/speed)<br>
- Added more columns in landscape mode<br>
- Changed the the searchfunction (searchfield)
</p>
<p><b>version 1.3.6</b><br>
- Added flags (They were accidentally left out in version 1.3.5)
</p>
<p><b>version 1.3.5</b><br>
- Tiny update to fix sleeptimer in Sailfishos 2.0
</p>
<p><b>version 1.3.4</b><br>
- Tweaking Error handling<br>
- Tweaking deletion of favorites<br>
- Small fix on sleeptimer
</p>

<p><b>version 1.3.3</b><br>
- found another error (country flags)<br>
- NEED TO DO SOME BETTER TESTING!!!</p>

<p><b>version 1.3.2</b><br>
- Corrected a fatal error when reading country flag from favorites!</p>

<p><b>version 1.3.1</b><br>
- Updated about page</p>

<p><b>version 1.3.0</b><br>
- Corrected a typing error in sleeptimer<br>
- Tweaked coverpage<br>
- Added changelog to about page</p>

<p><b>version 1.2.9</b><br>
- Making sure it behaves on incoming call</p>

<p><b>version 1.2.8</b><br>
- just a rebuild.</p>

<p><b>version 1.2.7</b><br>
- Able to resume play after sleeptimer stopped.</p>

<p><b>version 1.2.6</b><br>
- Detect earphones disconnection and set icon to pause<br>
- If clicking on current playing stream, it now reloads and start stream again (instead of doing nothing).<br>
- fixing playerPanel behavior when scrolling to the bottom of the list (it should get out of the way!).<br>
- Introducing new unforeseen bugs (features)!? :) </p>

<p><b>version 1.2.5</b><br>
- Fixed a bug making a lot of wake ups when idle (thank you Jolla for pointing that out!).<br>
- Added Search/Filter on channels<br>
- Changed the player internally to handle and show errors in a better way.<br>
- Maybe a little more?!</p>

<p><b>version 1.2.4</b><br>
- Fixed a bug (country not showing)<br>
- Sort order by title (all channels)</p>

<p><b>version 1.2.3</b><br>
- Sort order by title (favorites)</p>

<p><b>version 1.2.2</b><br>
- Major rewrite to prepare for filter search and sorting.<br>
- Some more tweaking of appearance.</p>

<p><b>version 1.2.1</b><br>
- Added Kosovo.<br>
- Changed look on flags (Switzerland and Vatican).<br>
- Changed Player behavior (hopefully looks and works nicer).<br>
- Small tweaks here and there... :)<br>
- Search and sort will have to wait (sorry).</p>

<p><b>Initial release 1.2</b></p>"
        }
    }
}
