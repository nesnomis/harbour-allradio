import QtQuick 2.0

ListModel {
	ListElement {
		source: "http://stream.ansradio.ws:8152/ANS-102FM-128k-Online.m3u"
		title: "ANS ÇM Radio 102 FM"
		site: "http://ansradio.ws/"
		section: "Top 40/Dance"
	}
	ListElement {
		source: "http://85.132.78.130:8081/mediafm-mp3.m3u"
		title: "Media FM"
		site: "http://www.mediafm.az/"
		section: "Top 40"
	}
	ListElement {
		source: "http://85.132.78.130:8081/antenn-mp3.m3u"
		title: "Radio Antenn"
		site: "http://www.antenn.az/"
		section: "Top 40"
	}
	ListElement {
		source: "http://mix.am:8000/mix.m3u"
		title: "Mix FM"
		site: "http://live.mix.am/"
		section: "Dance"
	}
}
