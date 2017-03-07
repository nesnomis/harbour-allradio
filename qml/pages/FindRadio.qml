import QtQuick 2.0
import Sailfish.Silica 1.0
import "../JSONListModel"

Page {
    id: radioPage
    property int stations
    property int tags
    property int countries

    SilicaListView {
        id: listView
        anchors.fill: parent
        anchors.bottomMargin: playerPanel.visibleSize
        clip: true

        GetStationUrl {
            id: stats
            source: "http://www.radio-browser.info/webservice/json/stats"
            //get: false

            onReadyChanged: {
                if (ready) {
                    stations = simple.stations
                    tags = simple.tags
                    countries = simple.countries
                }
            }
        }

        header: PageHeader {
            id: pHeader
            title: qsTr("Find radio station by")//searchby !== "bytag" ? "" : searchterm
        }

        ScrollDecorator {}

        property int retning: 0
        onContentYChanged: {
            if (atYBeginning) showPlayer = true
            if (atYEnd) showPlayer = false
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

        model: ListModel {
            id: startModel
            ListElement {
                rsource: 1
                ricon: "../allradio-data/images/bycountry_t.png"
            }
            ListElement {
                rsource: 2
                ricon: "../allradio-data/images/bytag_t.png"
            }
            ListElement {
                rsource: 3
                ricon: "../allradio-data/images/bysearch_t.png"
            }
            ListElement {
                rsource: 4
                ricon: "../allradio-data/images/bylatest_t.png"
            }
            ListElement {
                rsource: 5
                ricon: "../allradio-data/images/lastplayed_t.png"
            }
            ListElement {
                rsource: 6
                ricon: "../allradio-data/images/mostclicked_t.png"
            }
            ListElement {
                rsource: 7
                ricon: "../allradio-data/images/byvote_t.png"
            }
        }

        delegate: ListItem {
            id: byCountry
            contentHeight: Theme.itemSizeExtraLarge
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: Theme.paddingMedium
            anchors.rightMargin: Theme.paddingMedium

            Image {
               id: next
               anchors.verticalCenter: parent.verticalCenter
               anchors.right: parent.right
               anchors.rightMargin: Theme.paddingMedium
               source: "image://theme/icon-m-right"
            }

            Image {
               id: icon
               height: parent.height / 2
               fillMode: Image.PreserveAspectFit
               anchors.verticalCenter: parent.verticalCenter
               anchors.left: parent.left
               anchors.leftMargin: Theme.paddingMedium
               source: ricon //"../allradio-data/images/bycountry.png"// if (section.search(".png")>0) "../allradio-data/images/"+section.toLowerCase()+".png"; else "../allradio-data/images/"+section.toLowerCase()+".png";
            }

            Text {
                 id: text
                 text: {
                     switch (rsource) {
                         case 1: qsTr("Country")+" ("+countries+")";break;
                         case 2: qsTr("Tag")+" ("+tags+")";break
                         case 3: qsTr("Name")+" ("+stations+")";break
                         case 4: qsTr("New/changed")+" (50)";break
                         case 5: qsTr("Latest played")+" (50)";break
                         case 6: qsTr("Most played")+" (50)";break
                         case 7: qsTr("Most liked")+" (50)";break
                     }
                 }

                 color: highlighted ? Theme.highlightColor : Theme.primaryColor
                 anchors.leftMargin: Theme.paddingLarge
                 anchors.rightMargin: Theme.paddingMedium
                 anchors.left: icon.right
                 anchors.right: next.left
                 anchors.verticalCenter: parent.verticalCenter
                 wrapMode: Text.ElideRight
                 font.pixelSize: Theme.fontSizeLarge
                 maximumLineCount: 1
            }

            onClicked: {
                switch (rsource) {
                    case 1: pageStack.push(Qt.resolvedUrl("CountryChooser.qml"));break;
                    case 2: window.pageStack.push(Qt.resolvedUrl("Tags.qml"), {searchtitle: qsTr("Search by tag"),searchby: "bytag"});break
                    case 3: window.pageStack.push(Qt.resolvedUrl("Search.qml"),{searchby: "byname",searchtitle: qsTr("Search by name"),source: ""});break
                    case 4: window.pageStack.push(Qt.resolvedUrl("Search.qml"),{searchby: "lastchange",searchtitle: qsTr("Search by new/changed"),source: "http://www.radio-browser.info/webservice/json/stations/lastchange/50"});break
                    case 5: window.pageStack.push(Qt.resolvedUrl("Search.qml"),{searchby: "lastplay",searchtitle: qsTr("Search by Latest played"),source: "http://www.radio-browser.info/webservice/json/stations/lastclick/50"});break
                    case 6: window.pageStack.push(Qt.resolvedUrl("Search.qml"),{searchby: "mostclick",searchtitle: qsTr("Search by Most played"),source: "http://www.radio-browser.info/webservice/json/stations/topclick/50"});break
                    case 7: window.pageStack.push(Qt.resolvedUrl("Search.qml"),{searchby: "mostvote",searchtitle: qsTr("Search by Most likes"),source: "http://www.radio-browser.info/webservice/json/stations/topvote/50"});break
                }
            }
        }
        PullMenu {}
    }
        PlayerPanel { id:playerPanel}
}

