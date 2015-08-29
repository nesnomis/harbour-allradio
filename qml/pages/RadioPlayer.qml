/****************************************************************************************
** JSONListModel used here:
** ------------------------
** Copyright (c) 2007 Stefan Goessner (goessner.net)
** Copyright (c) 2012 Romain Pokrzywka (KDAB) (romain@kdab.com)
**
** Permission is hereby granted, free of charge, to any person obtaining
** a copy of this software and associated documentation files (the "Software"),
** to deal in the Software without restriction, including without limitation
** the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
** sell copies of the Software, and to permit persons to whom the Software is furnished
** to do so, subject to the following conditions:
**
** The above copyright notice and this permission notice shall be included in all copies
** or substantial portions of the Software.
*****************************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0
import "../JSONListModel"

Page {
    id: radioPage
    allowedOrientations: Orientation.All
    property Item contextMenu
    property alias model: listView.model
    property string rptitle: ""
    property string rpsite: ""
    property string rpsource: ""
    property string rpsection: ""
    property string rpicon: ""

    SilicaListView {
        id: listView

        quickScroll: false
        anchors.fill: parent
        anchors.bottomMargin: playerPanel.visibleSize
        clip: true

        JSONListModel {
            id: jsonModel1
            source: "../stations/"+country+".json"  //country + ".json"
            query: "$."+country+".channel[*]" //"$."+ country + ".channel[*]"
            sortby: "title"
            filterby: filter
            filterkey: key


        }
        model: jsonModel1.model

        header: PageHeader {
            id: pHeader
            title: ctitle
            height: 133

            TextField {
                id: searchField
                enabled: !favorites
                visible: !favorites
                anchors.fill: parent
                anchors.bottom: parent.bottom
                anchors.leftMargin: Theme.paddingMedium

                textTopMargin: 30
                textLeftMargin: 40
                textRightMargin: Theme.itemSizeSmall + Theme.paddingMedium

                font {
                    pixelSize: Theme.fontSizeLarge
                    family: Theme.fontFamilyHeading
                }

                inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhNoPredictiveText
                onTextChanged: if (text.length > 0) filter = text; else {filter = "";focus=false}
                onClicked: {
                    listView.currentIndex = -1;showPlayer = false;//pHeader.title = ""
                }
                focus: false
                EnterKey.iconSource: "image://theme/icon-m-enter-close"
                EnterKey.onClicked: focus = false

                IconButton {
                    x: searchField.textLeftMargin - width + 20

                    width: icon.width
                    height: parent.height
                    icon.source: "image://theme/icon-m-search"
                    highlighted: down || searchField._editor.activeFocus
                    visible: (!searchField._editor.activeFocus && searchField.text == "")
                    enabled: searchField.enabled

                    onClicked: {
                        searchField._editor.forceActiveFocus()
                    }
                }
            }
        }


        VerticalScrollDecorator {}

        property int retning: 0
        onContentYChanged: {
            if (!showPlayer && atYBeginning) showPlayer = true
            }
            onMovementStarted: {
                retning = contentY
            }
            onVerticalVelocityChanged: {
                if (showPlayer && contentY > retning+10) showPlayer = false; else if (!showPlayer && contentY < retning-10) showPlayer = true;
            }
            onMovementEnded: {
                //if (!showPlayer && contentY == -110) showPlayer = true
                    //console.log("verticalVolocity: "+verticalVelocity+" - contentY: "+contentY)
            }

            delegate: Item {
            id: myListItem
            property bool menuOpen: contextMenu != null && contextMenu.parent === myListItem

            width: ListView.view.width
            height: menuOpen ? contextMenu.height + contentItem.height : contentItem.height

            BackgroundItem {
                id: contentItem
                width: parent.width

                Label {
                    id: firstName
                    text: model.title
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: Theme.fontSizeLarge
                    x: Theme.paddingLarge
                }
                onPressAndHold: {
                    if (!contextMenu){
                        contextMenu = contextMenuComponent.createObject(listView);
                        showPlayer = false
                    }

                    rptitle = model.title
                    rpsite = model.site
                    rpsource = model.source
                    rpsection = model.section
                    rpicon = country

                    contextMenu.show(myListItem)

                }
                onClicked: {
                    ps(model.source)
                    radioStation = model.title
                    website = (Qt.resolvedUrl(model.site))
                    if (favorites == true && icon.search(".png")>0) picon = icon.toLowerCase(); // The old save in database
                    else picon = "../stations/"+icon+".png";
                }
            }
        }

            Component {
            id: contextMenuComponent

            ContextMenu {
                MenuItem {
                    id:mlisten
                    visible: true
                    text: qsTr("Listen")
                    onClicked: {
                        ps(rpsource)
                        radioStation = rptitle
                        if (favorites == true && icon.search(".png")>0) picon = icon.toLowerCase(); // The old save in database
                        else picon = "../stations/"+icon+".png";
                        website = (Qt.resolvedUrl(rpsite))
                    }
                }
                MenuItem {
                    id:madd
                    visible: !favorites
                    text: qsTr("Add to favorites")
                    onClicked: addDb(rpsource,rptitle,rpsite,rpsection,rpicon);
                    }
                MenuItem {
                    id:mdelete
                    visible: favorites
                    text: qsTr("Delete favourite")
                    RemorsePopup {id: remorse}
                    onClicked: remorse.execute(qsTr("Deleting channel"), function() {delDb(rpsource)}, 5000);
            }
            }
        }
            PullMenu {}
    }
    PlayerPanel { id:playerPanel }
}



