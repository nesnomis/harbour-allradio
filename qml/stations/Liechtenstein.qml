import QtQuick 2.0

ListModel {
	ListElement {
		source: "http://live.radiol.li:8000/live.m3u"
		title: "Radio Liechtenstein"
		site: "http://www.radio.li/"
		section: "Music/information"
	}
	ListElement {
		source: "http://live.radiol.li:8000/country.m3u"
		title: "Radio Liechtenstein Country"
		site: "http://www.radio.li/"
		section: "Country music"
	}
	ListElement {
		source: "http://live.radiol.li:8000/love.m3u"
		title: "Radio Liechtenstein Love"
		site: "http://www.radio.li/"
		section: "Love songs"
	}
	ListElement {
		source: "http://live.radiol.li:8000/rock.m3u"
		title: "Radio Liechtenstein Rock"
		site: "http://www.radio.li/"
		section: "Rock"
	}
	ListElement {
		source: "http://live.radiol.li:8000/schlager.m3u"
		title: "Radio Liechtenstein Schlager"
		site: "http://www.radio.li/"
		section: "Schlager"
	}
}
