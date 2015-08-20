import QtQuick 2.0
import Sailfish.Silica 1.0
import "../stations"

Page {
    id: countryPage
    allowedOrientations: Orientation.All

    /* --------------- START of Country edit --------------- */
    /* Add StationsListXX.qml to the stationsfolder, as with */
    /* country icons (size 200x125) */
    property variant albania: Albania {}
    property variant andorra: Andorra {}
    property variant armenia: Armenia {}
    property variant austria: Austria {}
    property variant azerbaijan: Azerbaijan {}
    property variant belarus: Belarus {}
    property variant belgium: Belgium {}
    property variant bosnia: Bosnia {}
    property variant bulgaria: Bulgaria {}
    property variant croatia: Croatia {}
    property variant cyprus: Cyprus {}
    property variant czechrepublic: Czechrepublic {}
    property variant denmark: Denmark {}
    property variant estonia: Estonia {}
    property variant faroe: Faroe {}
    property variant finland: Finland {}
    property variant france: France {}
    property variant georgia: Georgia {}
    property variant germany: Germany {}
    property variant gibraltar: Gibraltar {}
    property variant greece: Greece {}
    property variant hungary: Hungary {}
    property variant iceland: Iceland {}
    property variant ireland: Ireland {}
    property variant italy: Italy {}
    property variant latvia: Latvia {}
    property variant liechtenstein: Liechtenstein {}
    property variant lithuania: Lithuania {}
    property variant luxembourg: Luxembourg {}
    property variant macedonia: Macedonia {}
    property variant malta: Malta {}
    property variant moldova: Moldova {}
    property variant monaco: Monaco {}
    property variant montenegro: Montenegro {}
    property variant netherlands: Netherlands {}
    property variant norway: Norway {}
    property variant poland: Poland {}
    property variant portugal: Portugal {}
    property variant romania: Romania {}
    property variant russia: Russia {}
    property variant serbia: Serbia {}
    property variant slovakia: Slovakia {}
    property variant slovenia: Slovenia {}
    property variant spain: Spain {}
    property variant sweden: Sweden {}
    property variant switzerland: Switzerland {}
    property variant turkey: Turkey {}
    property variant uk: UK {}
    property variant ukraine: Ukraine {}
    property variant vatican: Vatican {}

    ListModel {
        id: galleryModel

        ListElement {
            coid: "_albania"
            icon: "../stations/Albania.png"}
        ListElement {
            coid: "_andorra"
            icon: "../stations/Andorra.png"}
        ListElement {
            coid: "_armenia"
            icon: "../stations/Armenia.png"}
        ListElement {
            coid: "_austria"
            icon: "../stations/Austria.png"}
        ListElement {
            coid: "_azerbaijan"
            icon: "../stations/Azerbaijan.png"}
        ListElement {
            coid: "_belarus"
            icon: "../stations/Belarus.png"}
        ListElement {
            coid: "_belgium"
            icon: "../stations/Belgium.png"}
        ListElement {
            coid: "_bosnia"
            icon: "../stations/Bosnia.png"}
        ListElement {
            coid: "_bulgaria"
            icon: "../stations/Bulgaria.png"}
        ListElement {
            coid: "_croatia"
            icon: "../stations/Croatia.png"}
        ListElement {
            coid: "_cyprus"
            icon: "../stations/Cyprus.png"}
        ListElement {
            coid: "_czechrepublic"
            icon: "../stations/Czechrepublic.png"}
        ListElement {
            coid: "_denmark"
            icon: "../stations/Denmark.png"}
        ListElement {
            coid: "_estonia"
            icon: "../stations/Estonia.png"}
        ListElement {
            coid: "_faroe"
            icon: "../stations/Faroe.png"}
        ListElement {
            coid: "_finland"
            icon: "../stations/Finland.png"}
        ListElement {
            coid: "_france"
            icon: "../stations/France.png"}
        ListElement {
            coid: "_georgia"
            icon: "../stations/Georgia.png"}
        ListElement {
            coid: "_germany"
            icon: "../stations/Germany.png"}
        ListElement {
            coid: "_gibraltar"
            icon: "../stations/Gibraltar.png"}
        ListElement {
            coid: "_greece"
            icon: "../stations/Greece.png"}
        ListElement {
            coid: "_hungary"
            icon: "../stations/Hungary.png"}
        ListElement {
            coid: "_iceland"
            icon: "../stations/Iceland.png"}
        ListElement {
            coid: "_ireland"
            icon: "../stations/Ireland.png"}
        ListElement {
            coid: "_italy"
            icon: "../stations/Italy.png"}
        ListElement {
            coid: "_latvia"
            icon: "../stations/Latvia.png"}
        ListElement {
            coid: "_liechtenstein"
            icon: "../stations/Liechtenstein.png"}
        ListElement {
            coid: "_lithuania"
            icon: "../stations/Lithuania.png"}
        ListElement {
            coid: "_luxembourg"
            icon: "../stations/Luxembourg.png"}
        ListElement {
            coid: "_macedonia"
            icon: "../stations/Macedonia.png"}
        ListElement {
            coid: "_malta"
            icon: "../stations/Malta.png"}
        ListElement {
            coid: "_moldova"
            icon: "../stations/Moldova.png"}
        ListElement {
            coid: "_monaco"
            icon: "../stations/Monaco.png"}
        ListElement {
            coid: "_montenegro"
            icon: "../stations/Montenegro.png"}
        ListElement {
            coid: "_netherlands"
            icon: "../stations/Netherlands.png"}
        ListElement {
            coid: "_norway"
            icon: "../stations/Norway.png"}
        ListElement {
            coid: "_poland"
            icon: "../stations/Poland.png"}
        ListElement {
            coid: "_portugal"
            icon: "../stations/Portugal.png"}
        ListElement {
            coid: "_romania"
            icon: "../stations/Romania.png"}
        ListElement {
            coid: "_russia"
            icon: "../stations/Russia.png"}
        ListElement {
            coid: "_serbia"
            icon: "../stations/Serbia.png"}
        ListElement {
            coid: "_slovakia"
            icon: "../stations/Slovakia.png"}
        ListElement {
            coid: "_slovenia"
            icon: "../stations/Slovenia.png"}
        ListElement {
            coid: "_spain"
            icon: "../stations/Spain.png"}
        ListElement {
            coid: "_sweden"
            icon: "../stations/Sweden.png"}
        ListElement {
            coid: "_switzerland"
            icon: "../stations/Switzerland.png"}
        ListElement {
            coid: "_turkey"
            icon: "../stations/Turkey.png"}
        ListElement {
            coid: "_uk"
            icon: "../stations/UK.png"}
        ListElement {
            coid: "_ukraine"
            icon: "../stations/Ukraine.png"}
        ListElement {
            coid: "_vatican"
            icon: "../stations/Vatican.png"}
        // Workaround to be able to use qsTr for translating the country names (qsTr doesn't work in ListModel/ListElement ... :( ..)
        function countryname(index) {
            if (countryname["text"] === undefined) {
                countryname.text = [
                    qsTr("Albania"),
                    qsTr("Andorra"),
                    qsTr("Armenia"),
                    qsTr("Austria"),
                    qsTr("Azerbaijan"),
                    qsTr("Belarus"),
                    qsTr("Belgium"),
                    qsTr("Bosnia"),
                    qsTr("Bulgaria"),
                    qsTr("Croatia"),
                    qsTr("Cyprus"),
                    qsTr("Czechrepublic"),
                    qsTr("Denmark"),
                    qsTr("Estonia"),
                    qsTr("Faroe"),
                    qsTr("Finland"),
                    qsTr("France"),
                    qsTr("Georgia"),
                    qsTr("Germany"),
                    qsTr("Gibraltar"),
                    qsTr("Greece"),
                    qsTr("Hungary"),
                    qsTr("Iceland"),
                    qsTr("Ireland"),
                    qsTr("Italy"),
                    qsTr("Latvia"),
                    qsTr("Liechtenstein"),
                    qsTr("Lithuania"),
                    qsTr("Luxembourg"),
                    qsTr("Macedonia"),
                    qsTr("Malta"),
                    qsTr("Moldova"),
                    qsTr("Monaco"),
                    qsTr("Montenegro"),
                    qsTr("Netherlands"),
                    qsTr("Norway"),
                    qsTr("Poland"),
                    qsTr("Portugal"),
                    qsTr("Romania"),
                    qsTr("Russia"),
                    qsTr("Serbia"),
                    qsTr("Slovakia"),
                    qsTr("Slovenia"),
                    qsTr("Spain"),
                    qsTr("Sweden"),
                    qsTr("Switzerland"),
                    qsTr("Turkey"),
                    qsTr("UK"),
                    qsTr("Ukraine"),
                    qsTr("Vatican")
                ]
                }
            return countryname.text[index]
        }

    } /// view.model.country(view.currentIndex)

    function chooseCountry(icon,coid,country) {
        ctitle = country
        cicon = icon

        if (coid == "_albania" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: albania})
        if (coid == "_andorra" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: andorra})
        if (coid == "_armenia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: armenia})
        if (coid == "_austria" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: austria})
        if (coid == "_azerbaijan" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: azerbaijan})
        if (coid == "_belarus" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: belarus})
        if (coid == "_belgium" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: belgium})
        if (coid == "_bosnia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: bosnia})
        if (coid == "_bulgaria" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: bulgaria})
        if (coid == "_croatia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: croatia})
        if (coid == "_cyprus" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: cyprus})
        if (coid == "_czechrepublic" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: czechrepublic})
        if (coid == "_denmark" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: denmark})
        if (coid == "_estonia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: estonia})
        if (coid == "_faroe" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: faroe})
        if (coid == "_finland" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: finland})
        if (coid == "_france" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: france})
        if (coid == "_georgia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: georgia})
        if (coid == "_germany" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: germany})
        if (coid == "_gibraltar" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: gibraltar})
        if (coid == "_greece" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: greece})
        if (coid == "_hungary" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: hungary})
        if (coid == "_iceland" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: iceland})
        if (coid == "_ireland" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: ireland})
        if (coid == "_italy" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: italy})
        if (coid == "_latvia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: latvia})
        if (coid == "_liechtenstein" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: liechtenstein})
        if (coid == "_lithuania" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: lithuania})
        if (coid == "_luxembourg" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: luxembourg})
        if (coid == "_macedonia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: macedonia})
        if (coid == "_malta" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: malta})
        if (coid == "_moldova" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: moldova})
        if (coid == "_monaco" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: monaco})
        if (coid == "_montenegro" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: montenegro})
        if (coid == "_netherlands" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: netherlands})
        if (coid == "_norway" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: norway})
        if (coid == "_poland" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: poland})
        if (coid == "_portugal" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: portugal})
        if (coid == "_romania" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: romania})
        if (coid == "_russia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: russia})
        if (coid == "_serbia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: serbia})
        if (coid == "_slovakia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: slovakia})
        if (coid == "_slovenia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: slovenia})
        if (coid == "_spain" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: spain})
        if (coid == "_sweden" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: sweden})
        if (coid == "_switzerland" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: switzerland})
        if (coid == "_turkey" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: turkey})
        if (coid == "_uk" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: uk})
        if (coid == "_ukraine" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: ukraine})
        if (coid == "_vatican" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: vatican})
    }
    /* --------------- END of Country edit --------------- */

    PlayerPanel { id:playerPanel }

    SilicaGridView {
        id: grid
        visible: true
        cellWidth: width / 2
        cellHeight: width / 2
        anchors.fill: parent

        anchors.bottomMargin: playerPanel.visibleSize
        clip: true

        model: galleryModel

        PullMenu {
            MenuItem {
                text: qsTr("Show as list")
                onClicked: grid.visible = false
            }
        }

        header: BackgroundItem {
            id: favHeader
            width: parent.width
            height: parent.width / 2.3
            onClicked: {
                ctitle = qsTr("Favorites")
                favorites = true
                window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),
                                             {model: dbModel} )
            }

                Image {
                    id: favIcon
                    anchors { right: parent.right; rightMargin: 40; verticalCenter: parent.verticalCenter }
                    source: "../harbour-allradio.png"
                    x: 70
                    y: 70
                    width: favHeader.width / 3.7
                    height: favHeader.width / 3.7
                    opacity: 0.6
                    fillMode: Image.PreserveAspectFit
                }

                Label {
                    anchors { left: parent.left; leftMargin: 40; bottom: favIcon.bottom }
                    text: qsTr("Favorites")
                    color: highlighted ? Theme.highlightColor : Theme.primaryColor
                    font.pixelSize: Theme.fontSizeHuge

                }

            }

        delegate: BackgroundItem {
                    width: (parent.width / 2); height: (parent.width / 2)

                    Image {
                        id: myIcon
                        y: 20; anchors.horizontalCenter: parent.horizontalCenter
                        source: icon
                        width: parent.width / 1.5
                        height: parent.width / 1.5
                        opacity: 0.6
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter }
                        text: grid.model.countryname(index)
                        color: highlighted ? Theme.highlightColor : Theme.primaryColor
                        font.pixelSize: Theme.fontSizeLarge

                    }

                    onClicked: {
                        favorites = false
                        chooseCountry(icon,coid,grid.model.countryname(index))
                    }
                }
        ScrollDecorator {}
    }

    SilicaListView {
        id: list
        visible: !grid.visible
        anchors.fill: parent

        anchors.bottomMargin: playerPanel.visibleSize
        clip: true

        model: galleryModel

        PullMenu {            MenuItem {
                text: qsTr("Show as grid")
                onClicked: grid.visible = true
            }}

        header: BackgroundItem {
            id: listfavHeader
            width: parent.width
            height: parent.width / 2.3
            onClicked: {
                ctitle = qsTr("Favorites")
                favorites = true
                window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),
                                             {model: dbModel} )
            }
            Image {
                id: favIcon
                anchors { right: parent.right; rightMargin: 40; verticalCenter: parent.verticalCenter }
                source: "../harbour-allradio.png"
                x: 70
                y: 70
                width: listfavHeader.width / 3.7
                height: listfavHeader.width / 3.7
                opacity: 0.6
                fillMode: Image.PreserveAspectFit
            }

            Label {
                anchors { left: parent.left; leftMargin: 40; bottom: favIcon.bottom }
                text: qsTr("Favorites")
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
                font.pixelSize: Theme.fontSizeHuge

            }
        }

        delegate: BackgroundItem {
            width: (parent.width)
            anchors { horizontalCenter: parent.horizontalCenter}

            Image {
                id: myListIcon
                y: 20; //anchors.horizontalCenter: parent.horizontalCenter
                anchors { right: parent.right; rightMargin: 40; verticalCenter: parent.verticalCenter }
                source: icon
                height: listText.height
                opacity: 0.6
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: listText
                anchors { left: parent.left; leftMargin: 40; verticalCenter: parent.verticalCenter }
                text: list.model.countryname(index)
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
                font.pixelSize: Theme.fontSizeLarge

            }

            onClicked: {
                favorites = false
                chooseCountry(icon,coid,list.model.countryname(index))
            }
        }
        ScrollDecorator {}
    }
}
