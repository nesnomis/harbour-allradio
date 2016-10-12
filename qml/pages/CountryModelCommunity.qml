import QtQuick 2.0

ListModel {
    id: countryModel

 //   ListElement {coid: "0"}
    ListElement {coid: ""}
    ListElement {coid: "albania"}
    ListElement {coid: "algeria"}
    ListElement {coid: "andorra"}
    ListElement {coid: "argentina"}
    ListElement {coid: "armenia"}
    ListElement {coid: "australia"}
    ListElement {coid: "austria"}
    ListElement {coid: "azerbaijan"}
    ListElement {coid: "bahamas"}
    ListElement {coid: "belarus"}
    ListElement {coid: "belgium"}
    ListElement {coid: "bolivia"}
    ListElement {coid: "bosnia and herzegovina"}
    ListElement {coid: "brazil"}
    ListElement {coid: "bulgaria"}
    ListElement {coid: "cameroun"}
    ListElement {coid: "canada"}
    ListElement {coid: "cape verde"}
    ListElement {coid: "chile"}
    ListElement {coid: "china"}
    ListElement {coid: "colombia"}
    ListElement {coid: "congo"}
    ListElement {coid: "costa rica"}
    ListElement {coid: "croatia"}
    ListElement {coid: "cyprus"}
    ListElement {coid: "czech republic"}
    ListElement {coid: "denmark"}
    ListElement {coid: "dominican republic"}
    ListElement {coid: "ecuador"}
    ListElement {coid: "egypt"}
    ListElement {coid: "estonia"}
    ListElement {coid: "faroe"}
    ListElement {coid: "finland"}
    ListElement {coid: "france"}
    ListElement {coid: "georgia"}
    ListElement {coid: "germany"}
    ListElement {coid: "ghana"}
    ListElement {coid: "gibraltar"}
    ListElement {coid: "greece"}
    ListElement {coid: "guatemala"}
    ListElement {coid: "guinea"}
    ListElement {coid: "hong kong"}
    ListElement {coid: "hungary"}
    ListElement {coid: "iceland"}
    ListElement {coid: "india"}
    ListElement {coid: "indonesia"}
    ListElement {coid: "international"}
    ListElement {coid: "iran"}
    ListElement {coid: "iraq"}
    ListElement {coid: "ireland"}
    ListElement {coid: "israel"}
    ListElement {coid: "italy"}
    ListElement {coid: "japan"}
    ListElement {coid: "jordan"}
    ListElement {coid: "kenya"}
    ListElement {coid: "kosovo"}
    ListElement {coid: "kuwait"}
    ListElement {coid: "latvia"}
    ListElement {coid: "liechtenstein"}
    ListElement {coid: "lithuania"}
    ListElement {coid: "luxembourg"}
    ListElement {coid: "macedonia"}
    ListElement {coid: "madagascar"}
    ListElement {coid: "malta"}
    ListElement {coid: "mauritius"}
    ListElement {coid: "mexico"}
    ListElement {coid: "moldova"}
    ListElement {coid: "monaco"}
    ListElement {coid: "montenegro"}
    ListElement {coid: "morocco"}
    ListElement {coid: "namibia"}
    ListElement {coid: "netherlands"}
    ListElement {coid: "new zealand"}
    ListElement {coid: "nicaragua"}
    ListElement {coid: "norway"}
    ListElement {coid: "palau"}
    ListElement {coid: "paraguay"}
    ListElement {coid: "peru"}
    ListElement {coid: "philippines"}
    ListElement {coid: "poland"}
    ListElement {coid: "portugal"}
    ListElement {coid: "puerto rico"}
    ListElement {coid: "romania"}
    ListElement {coid: "russia"}
    ListElement {coid: "saudi arabia"}
    ListElement {coid: "scotland"}
    ListElement {coid: "serbia"}
    ListElement {coid: "slovakia"}
    ListElement {coid: "slovenia"}
    ListElement {coid: "south africa"}
    ListElement {coid: "spain"}
    ListElement {coid: "suriname"}
    ListElement {coid: "sweden"}
    ListElement {coid: "switzerland"}
    ListElement {coid: "syria"}
    ListElement {coid: "thailand"}
    ListElement {coid: "trinidad and tobago"}
    ListElement {coid: "tunisia"}
    ListElement {coid: "turkey"}
    ListElement {coid: "ukraine"}
    ListElement {coid: "united arab emirates"}
    ListElement {coid: "united kingdom"}
    ListElement {coid: "united states of america"}
    ListElement {coid: "uruguay"}
    ListElement {coid: "vatican"}
    ListElement {coid: "venezuela"}
    ListElement {coid: "yemen"}
    function countryname(index) {
        if (countryname["text"] === undefined) {
            countryname.text = [
                    //    qsTr("Add favorite"),
                        qsTr("No country?"),
                        qsTr("Albania"),
                        qsTr("Algeria"),
                        qsTr("Andorra"),
                        qsTr("Argentina"),
                        qsTr("Armenia"),
                        qsTr("Australia"),
                        qsTr("Austria"),
                        qsTr("Azerbaijan"),
                        qsTr("Bahamas"),
                        qsTr("Belarus"),
                        qsTr("Belgium"),
                        qsTr("Bolivia"),
                        qsTr("Bosnia"),
                        qsTr("Brazil"),
                        qsTr("Bulgaria"),
                        qsTr("Cameroun"),
                        qsTr("Canada"),
                        qsTr("Cape Verde"),
                        qsTr("Chile"),
                        qsTr("China"),
                        qsTr("Colombia"),
                        qsTr("Congo"),
                        qsTr("Costa Rica"),
                        qsTr("Croatia"),
                        qsTr("Cyprus"),
                        qsTr("Czechrepublic"),
                        qsTr("Denmark"),
                        qsTr("Dominican Republic"),
                        qsTr("Ecuador"),
                        qsTr("Egypt"),
                        qsTr("Estonia"),
                        qsTr("Faroe"),
                        qsTr("Finland"),
                        qsTr("France"),
                        qsTr("Georgia"),
                        qsTr("Germany"),
                        qsTr("Ghana"),
                        qsTr("Gibraltar"),
                        qsTr("Greece"),
                        qsTr("Guatemala"),
                        qsTr("Guinea"),
                        qsTr("Hong Kong"),
                        qsTr("Hungary"),
                        qsTr("Iceland"),
                        qsTr("India"),
                        qsTr("Indonesia"),
                        qsTr("International"),
                        qsTr("Iran"),
                        qsTr("Iraq"),
                        qsTr("Ireland"),
                        qsTr("Israel"),
                        qsTr("Italy"),
                        qsTr("Japan"),
                        qsTr("Jordan"),
                        qsTr("Kenya"),
                        qsTr("Kosovo"),
                        qsTr("Kuwait"),
                        qsTr("Latvia"),
                        qsTr("Liechtenstein"),
                        qsTr("Lithuania"),
                        qsTr("Luxembourg"),
                        qsTr("Macedonia"),
                        qsTr("Madagascar"),
                        qsTr("Malta"),
                        qsTr("Mauritius"),
                        qsTr("Mexico"),
                        qsTr("Moldova"),
                        qsTr("Monaco"),
                        qsTr("Montenegro"),
                        qsTr("Morocco"),
                        qsTr("Namibia"),
                        qsTr("Netherlands"),
                        qsTr("New Zealand"),
                        qsTr("Nicaragua"),
                        qsTr("Norway"),
                        qsTr("Palau"),
                        qsTr("Paraguay"),
                        qsTr("Peru"),
                        qsTr("Philippines"),
                        qsTr("Poland"),
                        qsTr("Portugal"),
                        qsTr("Puerto Rico"),
                        qsTr("Romania"),
                        qsTr("Russia"),
                        qsTr("Saudi Arabia"),
                        qsTr("Scotland"),
                        qsTr("Serbia"),
                        qsTr("Slovakia"),
                        qsTr("Slovenia"),
                        qsTr("South Africa"),
                        qsTr("Spain"),
                        qsTr("Suriname"),
                        qsTr("Sweden"),
                        qsTr("Switzerland"),
                        qsTr("Syria"),
                        qsTr("Thailand"),
                        qsTr("Trinidad and Tobago"),
                        qsTr("Tunisia"),
                        qsTr("Turkey"),
                        qsTr("Ukraine"),
                        qsTr("United Arab Emirates"),
                        qsTr("United Kingdom"),
                        qsTr("United states"),
                        qsTr("Uruguay"),
                        qsTr("Vatican"),
                        qsTr("Venezuela"),
                        qsTr("Yemen")
                    ]
            }
        return countryname.text[index]
    }
}
