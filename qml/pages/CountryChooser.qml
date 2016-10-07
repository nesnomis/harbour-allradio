import QtQuick 2.0
import Sailfish.Silica 1.0
import "../JSONListModel"

Page {
    id: countryPage

    SilicaGridView {
        id: grid
        visible: true
        anchors.fill: parent
        clip: true

        cellWidth: isPortrait ? width / 2 : width / 3
        cellHeight: isPortrait ? width / 2 : width / 3

        property int retning: 0

        onContentYChanged: {
            if (!showPlayer && atYBeginning) showPlayer = true
        }
        onMovementStarted: {
                retning = contentY
        }
        onVerticalVelocityChanged: {
            if (showPlayer && contentY > retning+10 || atYEnd) showPlayer = false; else if (!showPlayer && contentY < retning-10 && !atYEnd) showPlayer = true;

        }
        onMovementEnded: {
                //console.log("verticalVolocity: "+verticalVelocity+" - contentY: "+contentY)
        }

     /*   JSONListModel {
            id: jsonModel1
            source: internal ? "" : "http://www.radio-browser.info/webservice/json/countries"  //?hidebroken=true&order=stationcount"
            query: internal ? "$[*]" : "$[?(@.stationcount>0)]"
            get: false
        } */

        model: internal ? countryModel : getCountries.model

        header: PageHeader {
            title: !internal ? qsTr("Countries") : "Internal (listenlive.eu)"
           // height: choose._menuOpen ? choose.contentHeight + choose.height : choose.height

        /*    ComboBox {
                id: choose
                width: 480
                label: "Screen brightness"

                menu: ContextMenu {
                    MenuItem { text: "automatic" }
                    MenuItem { text: "manual" }
                    MenuItem { text: "high" }
                }
            } */
            }

        delegate: BackgroundItem {
            width: isPortrait ? parent.width / 2 : parent.width / 3 //(parent.width / 2);
            height: isPortrait ? parent.width / 2 : parent.width / 3

            Image {
                id: myIcon
                anchors.horizontalCenter: parent.horizontalCenter
                source: model.coid == "0" ? "../allradio-data/images/allradio.png" : "../allradio-data/images/"+model.value.toLowerCase()+".png" //internal ? coid == "0" ? "../allradio-data/images/allradio.png" : "../allradio-data/images/"+coid+".png" : "../allradio-data/images/"+value.toLowerCase()+".png"
                width: parent.width / 1.5
                height: parent.width / 1.5
                opacity: 0.6
                fillMode: Image.PreserveAspectFit
            }

            Text {
                anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter; }
                text: internal ? grid.model.countryname(index) : findCountry(model.value.toLowerCase()) ? findCountry(model.value.toLowerCase()) : model.value
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
                font.pixelSize: Theme.fontSizeMedium
                elide: Text.ElideMiddle

            }

            onClicked: {
                favorites = false
                ctitle = internal ? list.model.countryname(index) : findCountry(model.value.toLowerCase()) ? findCountry(model.value.toLowerCase()) : ""
                country = internal ? coid : model.value.toLowerCase()
                filter = ""
                key = internal ? "title" : "name"
                window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml")) //coid == "0" ? window.pageStack.push(Qt.resolvedUrl("AddOwnRadio.qml")) : window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml")) //internal ? coid == "0" ? window.pageStack.push(Qt.resolvedUrl("AddOwnRadio.qml")) : window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml")) : window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"))
            }
        }

        PullMenu {
            MenuItem {
                text: qsTr("Show as list")
                onClicked: grid.visible = false
            }
        }

        ViewPlaceholder {
            enabled: grid.count === 0 //|| jsonModel1.jsonready
            text: qsTr("No countries!?")
            hintText: qsTr("Be patient or check connection!")
        }

        ScrollDecorator {}
    }

    SilicaListView {
        id: list
        visible: !grid.visible
        anchors.fill: parent
        anchors.bottomMargin: playerPanel.visibleSize
        clip: true

        property int retning: 0

        onContentYChanged: {
            if (!showPlayer && atYBeginning) showPlayer = true
            if (atYEnd) showPlayer = false
        }
        onMovementStarted: {
            retning = contentY
        }
        onVerticalVelocityChanged: {
            if (showPlayer && contentY > retning+10) showPlayer = false; else if (!showPlayer && contentY < retning-10) showPlayer = true;
        }
        onMovementEnded: {
                //console.log("verticalVolocity: "+verticalVelocity+" - contentY: "+contentY)
        }

        model: internal ? countryModel : countryModelCommunity
        header: PageHeader {
            title: !internal ? "Community radio browser" : "Internal (listenlive.eu)"
        }

        delegate: BackgroundItem {
            id: favBack
            width: (parent.width)
            anchors { horizontalCenter: parent.horizontalCenter; }

            Image {
                id: myListIcon
                y: 20;
                anchors { right: parent.right; rightMargin: Theme.paddingLarge; verticalCenter: parent.verticalCenter }
                source: coid == "0" ? "../allradio-data/images/allradio.png" : coid ? "../allradio-data/images/"+coid+".png" : ""    //internal ? coid == "0" ? "../allradio-data/images/allradio.png" : "../allradio-data/images/"+coid+".png" : "../allradio-data/images/"+value.toLowerCase()+".png"
                height: listText.height
                opacity: 0.6
                fillMode: Image.PreserveAspectFit
            }

            Label {
                id: listText
                anchors { left: parent.left; leftMargin: Theme.paddingLarge; verticalCenter: parent.verticalCenter }
                text: list.model.countryname(index)//internal ? list.model.countryname(index) : findCountry(value.toLowerCase())
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
                font.pixelSize: Theme.fontSizeMedium
                truncationMode: TruncationMode.Fade

            }

            onClicked: {
                favorites = false
                ctitle = list.model.countryname(index)//internal ? list.model.countryname(index) : name
                country = coid //internal ? coid : name.toLowerCase()
                filter = ""
                key = internal ? "title" : "name"
                coid == "0" ? window.pageStack.push(Qt.resolvedUrl("AddOwnRadio.qml")) : window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml")) //internal ? coid == "0" ? window.pageStack.push(Qt.resolvedUrl("AddOwnRadio.qml")) : window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml")) : window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"))
            }
        }
        ScrollDecorator {}

        PullMenu {
            MenuItem {
                text: qsTr("Show as grid")
                onClicked: grid.visible = true
            }
        }

        ViewPlaceholder {
            enabled: list.count === 0 //|| jsonModel1.jsonready
            text: qsTr("No countries!?")
            hintText: qsTr("Be patient or check connection!")
        }
    }

    PlayerPanel {id:playerPanel}
}
