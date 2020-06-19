import QtQuick 2.0
import Sailfish.Silica 1.0
import "../JSONListModel"

Dialog {
    property string infotext: qsTr("Add or share your own favorite:")
    property string name
    property alias titlfield: titleField.text
    property alias streamurlfield: streamUrlField.text
    property alias homepagefield: homepageField.text
    property alias sectionfield: sectionField.text

    property alias countryfield: countryField.text
    //property alias statefield: stateField.text
    property alias languagefield: languageField.text
    property alias faviconimage: faviconImage.source
    property string first: ""
    width: parent.width
    height: parent.height

    DialogHeader {
        id: header
        //title: infotext
    }

    SilicaFlickable {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: header.bottom
        anchors.topMargin: Theme.paddingLarge
        anchors.bottom: parent.bottom
        contentX: 0
        contentHeight: countryMenu.visible ? countryMenu.height + column.height + testButton.height + infoText.height +  (Theme.paddingLarge * 4) : column.height + testButton.height + infoText.height +  (Theme.paddingLarge * 4)
        clip: true

        JSONListModel {
            id: getIt
            query: "$[*]" //"$[?(@.value.charAt(0)==='"+first+"')]"
        }


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
            width: parent.width - Theme.paddingMedium * 2
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingSmall
            anchors.top: infoText.bottom
            anchors.topMargin: Theme.paddingLarge * 2

            TextField {
                id: titleField
                width: parent.width
                placeholderText: qsTr("Name")
                inputMethodHints: Qt.ImhNoPredictiveText
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: {focus = false;streamUrlField.focus = true;}
                focus: true;
                onClicked:  playerPanel.open = false
                label: focus ? qsTr("Name") : ""
            }

            TextField {
                id: streamUrlField
                width: parent.width
                placeholderText: qsTr("Stream url")
                inputMethodHints: Qt.ImhUrlCharactersOnly | Qt.ImhNoPredictiveText
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: {focus = false;homepageField.focus = true}
                focus: false;
                onClicked:  playerPanel.open = false
                label: focus ? qsTr("Stream url") : ""
                validator: RegExpValidator {regExp: /((?:https?\:\/\/|www\.)(?:[-a-z0-9]+\.)*[-a-z0-9]+.*)/i}
            }

            TextField {
                id: homepageField
                width: parent.width
                placeholderText: qsTr("Homepage")
                inputMethodHints: Qt.ImhUrlCharactersOnly | Qt.ImhNoPredictiveText
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: {focus = false;countryField.focus = true}
                focus: false;
                onClicked:  playerPanel.open = false
                label: focus ? qsTr("Homepage") : ""
                validator: RegExpValidator {regExp: /((?:https?\:\/\/|www\.)(?:[-a-z0-9]+\.)*[-a-z0-9]+.*)/i}
            }
            Image {
                id: faviconImage
            }

            TextField {
                id: countryField
                width: parent.width
                placeholderText: qsTr("Country")
                //inputMethodHints: Qt.ImhNoPredictiveText | Qt.Im
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: {focus = false;countryMenu.hide();;languageField.focus = true}
                focus: false;

                onClicked:  playerPanel.open = false
                onTextChanged: if (text.length > 1)  {first = text.charAt(0);getIt.source = "https://www.radio-browser.info/webservice/json/countries/"+text;countryMenu.show(countryCombo)} else {first="";getIt.source = ""; countryMenu.hide();getIt.model.clear()}
                label: focus ? qsTr("Country") : ""
            }

           /*  ListItem {
                id: countryCombo
                width: parent.width
                height: getIt.count > 0 ? countryMenu.height : 0
                //clip: true
                //visible: getIt.count > 0 ? true : false

                //visible: getIt.count > 0 ? true : false

               menu:  ContextMenu {
                    id: countryMenu
                    //focus: countryCombo.height > 0 ? true : false
                    Repeater {
                        model: getIt.model
                        MenuItem { text: model.value;onClicked: {countryField.text = text; countryMenu.hide();languageField.focus = true}}
                    }
                }
            }*/

            TextField {
                id: languageField
                width: parent.width
                placeholderText: qsTr("Language")
                inputMethodHints: Qt.ImhNoPredictiveText | Qt.Imh
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: {focus = false;languageMenu.hide();sectionField.focus = true}
                focus: false;
                onClicked:  playerPanel.open = false
                onTextChanged: if (text.length > 1)  {first=text.charAt(0);getIt.source = "https://www.radio-browser.info/webservice/json/languages/"+text;languageMenu.show(languageCombo)} else {getIt.source = "";first="";getIt.model.clear(); languageMenu.hide()}
                label: focus ? qsTr("Language") : ""
            }

            ListItem {
                id: languageCombo
                width: parent.width
                height: getIt.count > 0 ? languageMenu.height : 0
                //visible: getIt.count > 0 ? true : false

                menu:  ContextMenu {
                    id: languageMenu

                    Repeater {
                        model: getIt.model
                        MenuItem { text: model.name;onClicked: {languageField.text = text; languageMenu.hide();sectionField.focus = true}}
                    }
                }
            }

            Row {
                width: parent.width
                TextField {
                    id: sectionField
                    width: parent.width - tagButton.width
                    placeholderText: qsTr("Tags (separate by ',' (e.g: 'rock,jazz')")
                    inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhNoPredictiveText
                    //inputMethodHints: Qt.Im
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: {focus = false;testButton.focus = true}
                    focus: false;
                    onClicked:  playerPanel.open = false
                    label: focus ? qsTr("Tags (separate by ',' (e.g: 'rock,jazz')") : ""
                }
                IconButton {
                    id: tagButton
                    icon.height: parent.height / 2
                    icon.fillMode: Image.PreserveAspectFit
                    icon.source: "../allradio-data/images/bytag.png"
                    onClicked: window.pageStack.push(Qt.resolvedUrl("Tags.qml"), {searchtitle: qsTr("Search by tag"),searchby: "bytag"})
                }
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

