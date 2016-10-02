import QtQuick 2.0
import Sailfish.Silica 1.0
import "../JSONListModel"

Page {
    width: parent.width
    height: parent.height
    property int stcount: 6

    JSONListModel {
        id: getTags
        source: "http://www.radio-browser.info/webservice/json/tags"
        query: "$[?(@.stationcount>"+stcount+")]"
    }

    SilicaFlickable {
        anchors.fill: parent
        anchors.bottomMargin: playerPanel.visibleSize
        contentWidth: parent.width;
        contentHeight: flow.childrenRect.height + Theme.paddingLarge
        clip: true
        ScrollDecorator {}

        property int retning: 0
        onContentYChanged: {
            if (atYBeginning) showPlayer = true
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


            PageHeader {
                        id: pHeader
                        title: qsTr("Most popular tags")

                /*        SearchField {
                            id: searchField
                            //visible: searchby !== "bytag" ? true : false
                            anchors.fill: parent
                            placeholderText: qsTr("Search tag")
                            //text: searchterm
                            inputMethodHints: Qt.ImhNoAutoUppercase //| Qt.ImhNoPredictiveText
                            EnterKey.iconSource: "image://theme/icon-m-enter-close"
                            EnterKey.onClicked: {focus = false;}
                            focus: false
                            onTextChanged: if (text.length > 1) {stcount = 0; getTags.source = "http://www.radio-browser.info/webservice/json/tags/"+text;} else {stcount = 6; getTags.source = "http://www.radio-browser.info/webservice/json/tags";focus=true;getTags.model.clear()}
                            onClicked: {showPlayer = false;searching=true}
                        } */
                    }

        Flow {
            id: flow
            //anchors.fill: parent
            anchors.top: pHeader.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: Theme.paddingLarge
            spacing: Theme.paddingLarge
            //property int min: Theme.fontSizeTiny
           // property int max: Theme.fontSizeHuge

            Repeater {
                id: elements
                model: getTags.model
                Text {
                    id: tagtext
                    text: model.value;

                   // font.pointSize: (model.stationcount / 300) * (Theme.fontSizeExtraLarge - Theme.fontSizeTiny) + Theme.fontSizeTiny

                    font.pixelSize: {
                        Theme.fontSizeHuge
                        if (model.stationcount < 5) Theme.fontSizeExtraSmall;
                        else if (5 <= model.stationcount &&  model.stationcount < 10) Theme.fontSizeSmall;
                        else if (10 <= model.stationcount &&  model.stationcount < 18) Theme.fontSizeMedium;
                        else if (18 <= model.stationcount &&  model.stationcount < 37) Theme.fontSizeLarge;
                        else if (37 <= model.stationcount &&  model.stationcount < 65) Theme.fontSizeExtraLarge;
                        else Theme.fontSizeHuge;
}

                 /*   color: {
                        if (font.pointSize < Theme.fontSizeMedium) Theme.secondaryColor;
                        else if (font.pointSize >= Theme.fontSizeMedium && font.pointSize < Theme.fontSizeLarge) Theme.highlightDimmerColor;
                        else if (font.pointSize >= Theme.fontSizeLarge && font.pointSize < Theme.fontSizeExtraLarge) Theme.highlightBackgroundColor //primaryColor;
                        else if (font.pointSize >= Theme.fontSizeExtraLarge && font.pointSize < Theme.fontSizeHuge) Theme.primaryColor //primaryColor;
                        else Theme.secondaryHighlightColor
                    } *

                 /*   let min = 12, max = 24
                    for each tag
                        font = (items / items in biggest tag) * (max - min) + min */


                    //font.pixelSize: Theme.fontSizeTiny + (model.stationcount / 3 )

              /*      font.pixelSize: {
                        Theme.fontSizeHuge
                        if (model.stationcount < 7) Theme.fontSizeExtraSmall + model.stationcount;
                        else if (7 <= model.stationcount &&  model.stationcount < 11) Theme.fontSizeExtraSmall + (model.stationcount -11);
                        else if (11 <= model.stationcount &&  model.stationcount < 18) Theme.fontSizeExtraSmall + (model.stationcount -18);
                        else if (18 <= model.stationcount &&  model.stationcount < 27) Theme.fontSizeExtraSmall + (model.stationcount -27);
                        else if (27 <= model.stationcount &&  model.stationcount < 40) Theme.fontSizeExtraSmall + (model.stationcount -40);
                        else if (40 <= model.stationcount &&  model.stationcount < 70) Theme.fontSizeExtraSmall + (model.stationcount -70);
                        else Theme.fontSizeHuge;
                    } */
              /*      font.pixelSize: {
                        Theme.fontSizeHuge
                        if (model.stationcount < 7) Theme.fontSizeTiny;
                        else if (7 <= model.stationcount &&  model.stationcount < 9) Theme.fontSizeExtraSmall;
                        else if (9 <= model.stationcount &&  model.stationcount < 12) Theme.fontSizeSmall;
                        else if (12 <= model.stationcount &&  model.stationcount < 18) Theme.fontSizeMedium;
                        else if (18 <= model.stationcount &&  model.stationcount < 29) Theme.fontSizeLarge;
                        else if (29 <= model.stationcount &&  model.stationcount < 50) Theme.fontSizeExtraLarge;
                        else Theme.fontSizeHuge;
                    } */

                    color: Theme.primaryColor
                    MouseArea {
                        id: m
                        anchors.fill: parent
                        onPressedChanged: pressed ? tagtext.color = Theme.highlightColor : tagtext.color = Theme.primaryColor
                        onClicked: window.pageStack.push(Qt.resolvedUrl("Search.qml"),
                                                                    {searchterm: model.value,searchby: "bytag"})
                    }
                }
            }
        }
        PullMenu {
            MenuItem {
                text: qsTr("Search by name")
                onClicked: window.pageStack.replace(Qt.resolvedUrl("Search.qml"),
                                                 {searchby: "byname",searchtitle: qsTr("Search by name")})
            }
        }
    }
    PlayerPanel { id:playerPanel}

}
