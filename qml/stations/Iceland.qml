import QtQuick 2.0

ListModel {
	ListElement {
		source: "http://93.95.74.162:8000/listen.pls"
		title: "Útvarp Kántrýbær"
		site: "http://www.kantry.is/kantryutvarpid.htm"
		section: "Country music"
	}
	ListElement {
		source: "http://radio.is:443/saga.m3u"
		title: "Utvarp Saga 99,4"
		site: "http://www.utvarpsaga.is/"
		section: "News/Talk"
	}
}
