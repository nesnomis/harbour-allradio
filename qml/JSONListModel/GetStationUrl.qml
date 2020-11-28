import QtQuick 2.0

Item {
    property string source: ""
    property variant simple
    property variant simpletmp
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

        simpletmp = eval('new Object(' + json + ')');
        if (Array.isArray(simpletmp)) {
            simple = simpletmp[0];
        } else {
            simple = simpletmp;
        }
        ready = true;
    }
}

