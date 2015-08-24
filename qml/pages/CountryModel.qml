import QtQuick 2.0

ListModel {
    id: countryModel

    ListElement {coid: "albania"}
    ListElement {coid: "andorra"}
    ListElement {coid: "armenia"}
    ListElement {coid: "austria"}
    ListElement {coid: "azerbaijan"}
    ListElement {coid: "belarus"}
    ListElement {coid: "belgium"}
    ListElement {coid: "bosnia"}
    ListElement {coid: "bulgaria"}
    ListElement {coid: "croatia"}
    ListElement {coid: "cyprus"}
    ListElement {coid: "czech-republic"}
    ListElement {coid: "denmark"}
    ListElement {coid: "estonia"}
    ListElement {coid: "faroe"}
    ListElement {coid: "finland"}
    ListElement {coid: "france"}
    ListElement {coid: "georgia"}
    ListElement {coid: "germany"}
    ListElement {coid: "gibraltar"}
    ListElement {coid: "greece"}
    ListElement {coid: "hungary"}
    ListElement {coid: "iceland"}
    ListElement {coid: "ireland"}
    ListElement {coid: "italy"}
    ListElement {coid: "kosovo"}
    ListElement {coid: "latvia"}
    ListElement {coid: "liechtenstein"}
    ListElement {coid: "lithuania"}
    ListElement {coid: "luxembourg"}
    ListElement {coid: "macedonia"}
    ListElement {coid: "malta"}
    ListElement {coid: "moldova"}
    ListElement {coid: "monaco"}
    ListElement {coid: "montenegro"}
    ListElement {coid: "netherlands"}
    ListElement {coid: "norway"}
    ListElement {coid: "poland"}
    ListElement {coid: "portugal"}
    ListElement {coid: "romania"}
    ListElement {coid: "russia"}
    ListElement {coid: "serbia"}
    ListElement {coid: "slovakia"}
    ListElement {coid: "slovenia"}
    ListElement {coid: "spain"}
    ListElement {coid: "sweden"}
    ListElement {coid: "switzerland"}
    ListElement {coid: "turkey"}
    ListElement {coid: "uk"}
    ListElement {coid: "ukraine"}
    ListElement {coid: "vatican"}
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
                qsTr("Kosovo"),
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
}
