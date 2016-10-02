import QtQuick 2.0

Item {
    property string source: ""
    property variant simple
    property string json: ""
    property bool ready: false
    property bool get: true

    onSourceChanged: {
        ready = false
        //simple = ""

        var xhr = new XMLHttpRequest;
        xhr.open(get ? "GET" : "POST", source);
        xhr.setRequestHeader('User-Agent',useragent);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200)
                json = xhr.responseText;
        }
        xhr.send();
    }

    onJsonChanged: {
        if ( json === "" )
            return;

        simple = eval('new Object(' + json + ')');ready = true;
    }
}

