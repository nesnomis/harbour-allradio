import QtQuick 2.0

ListModel {
	ListElement {
		source: "http://stream.ras2.fo:8020/ras2.m3u"
		title: "Rás2"
		site: "http://www.ras2.fo/"
		section: "News/Talk/Music"
	}
	ListElement {
		source: "http://www.listenlive.eu/kissfmhighfo.m3u"
		title: "Kiss FM"
		site: "http://radio.portal.fo/"
		section: "80s/90s music"
	}
	ListElement {
		source: "http://www.listenlive.eu/voxpophighfo.m3u"
		title: "VoxPop"
		site: "http://radio.portal.fo/"
		section: "Top 40"
	}
	ListElement {
		source: "http://sc4.spacialnet.com:14326/listen.pls"
		title: "Lindin"
		site: "http://www.lindin.fo/"
		section: "Christian"
	}
}
