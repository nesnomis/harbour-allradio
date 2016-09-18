import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    property string name
    property string infotext: qsTr("Add your own favorite:")
    property alias titlfield: titleField.text
    property alias streamurlfield: streamUrlField.text
    property alias homepagefield: homepageField.text
    property alias sectionfield: sectionField.text
    width: parent.width
    height: parent.height

    DialogHeader {
        id: header
        title: infotext
    }

    SilicaFlickable {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: header.bottom
        anchors.topMargin: Theme.paddingLarge
        anchors.bottom: parent.bottom
        contentX: 0
        contentHeight: column.height + testButton.height + infoText.height + (Theme.paddingLarge * 4)
        clip: true

        Text {
            id: infoText
            text: qsTr("Radio station name and stream url is needed to save or test stream!")
            font.pixelSize: Theme.fontSizeMedium
            color: Theme.secondaryHighlightColor
            width: parent.width
            wrapMode: Text.WordWrap
            anchors.left: parent.left
            anchors.leftMargin: Theme.paddingMedium
            anchors.right: parent.right
            anchors.rightMargin: Theme.paddingMedium
        }

        Column {
            id:column
            width: parent.width
            spacing: Theme.paddingSmall
            anchors.top: infoText.bottom
            anchors.topMargin: Theme.paddingLarge * 2

            TextField {
                id: titleField
                width: parent.width
                placeholderText: qsTr("Radio station name")
                inputMethodHints: Qt.ImhNoPredictiveText
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: {focus = false;streamUrlField.focus = true;}
                focus: true;
                onClicked:  playerPanel.open = false
                label: "Name"
            }

            TextField {
                id: streamUrlField
                width: parent.width
                placeholderText: qsTr("Radio station stream url")
                inputMethodHints: Qt.ImhUrlCharactersOnly | Qt.ImhNoPredictiveText
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: {focus = false;homepageField.focus = true}
                focus: false;
                onClicked:  playerPanel.open = false
                label: "Url"
                validator: RegExpValidator {regExp: /((?:https?\:\/\/|www\.)(?:[-a-z0-9]+\.)*[-a-z0-9]+.*)/i}
            }

            TextField {
                id: homepageField
                width: parent.width
                placeholderText: qsTr("Radtio station homepage")
                inputMethodHints: Qt.ImhUrlCharactersOnly | Qt.ImhNoPredictiveText
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: {focus = false;sectionField.focus = true}
                focus: false;
                onClicked:  playerPanel.open = false
                label: "Homepage"
                validator: RegExpValidator {regExp: /((?:https?\:\/\/|www\.)(?:[-a-z0-9]+\.)*[-a-z0-9]+.*)/i}
            }

            TextField {
                id: sectionField
                width: parent.width
                placeholderText: qsTr("Tags (separete by '/')")
                inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhNoPredictiveText
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: {focus = false;testButton.focus = true}
                focus: false;
                onClicked:  playerPanel.open = false
                label: "Tags"
            }
        }

        Button {
            id: testButton
            anchors.top: column.bottom
            anchors.topMargin: Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: streamUrlField.text !== "" && titleField.text !== ""
            text: qsTr("Test radio station")
            onPressed: {
                ps(streamUrlField.text)
                radioStation = titleField.text
                //if (icon.search(".png")>0) picon = icon.toLowerCase(); // The old save in database
                picon = "../harbour-allradio.png"
                website = (Qt.resolvedUrl(homepageField.text))
                playerPanel.open = true
            }
        }
    }

        onDone: {
            if (result == DialogResult.Accepted) {
                if (titleField.text !== "" && streamUrlField.text !== "") updateDb(streamUrlField.text,titleField.text,homepageField.text,sectionField.text,"0");
                //console.log("Fav added") //name = nameField.text
            }
            if (result == DialogResult.Rejected) {
                console.log("Fav rejected") //name = nameField.text
            }
        }
        PlayerPanel {id:playerPanel;open: false}
}

