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
   // allowedOrientations: Orientation.All
    property alias model: listView.model

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
                onTextChanged: if (text.length > 0) filter = text; else {filter = "";focus=false;}
                onClicked: {
                    listView.currentIndex = -1;showPlayer = false;//pHeader.title = ""
                }
                focus: false
                EnterKey.iconSource: "image://theme/icon-m-enter-close"
                EnterKey.onClicked: {focus = false;}

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
                        //searching = true
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

            delegate: ListItem {
            id: myListItem
            menu: contextMenu
            showMenuOnPressAndHold: true
            ListView.onRemove: animateRemoval(myListItem)

            width: ListView.view.width
            height: menuOpen ? contextMenu.height + contentItem.height : contentItem.height

            function remove() {
                remorseAction("Deleting", function() { delDb(source);listView.model.remove(index) })
            }

            Label {
                 id: firstName
                 text: model.title
                 color: highlighted ? Theme.highlightColor : Theme.primaryColor
                 anchors.verticalCenter: parent.verticalCenter
                 font.pixelSize: Theme.fontSizeLarge
             }

            onClicked: {
                ps(source)
                radioStation = title
                if (favorites && icon.search(".png")>0) picon = icon.toLowerCase(); // The old save in database
                else if (favorites) picon = "../stations/"+icon+".png"; else picon = "../stations/"+country+".png"
                website = (Qt.resolvedUrl(site))
            }

             ContextMenu {
                 id: contextMenu
                 MenuItem {
                     id:mlisten
                     visible: true
                     text: qsTr("Listen")
                     onClicked: {
                         ps(source)
                         radioStation = title
                         if (favorites && icon.search(".png")>0) picon = icon.toLowerCase(); // The old save in database
                         else if (favorites) picon = "../stations/"+icon+".png"; else picon = "../stations/"+country+".png"
                         website = (Qt.resolvedUrl(site))
                     }
                 }
                 MenuItem {
                     id:madd
                     visible: !favorites
                     text: qsTr("Add to favorites")
                     onClicked: addDb(source,title,site,section,country);
                     }
                 MenuItem {
                     id:mdelete
                     visible: favorites
                     text: qsTr("Delete favourite")

                     onClicked: remove()//listView.currentItem.remove(rpindex,rpsource) //listView.remorseAction();
                     //remorse.execute(qsTr("Deleting channel"), function() {delDb(rpsource)}, 5000);
                 }
             }

            }
            PullMenu {}
    }
    PlayerPanel { id:playerPanel }
}



