// Script to get the real stream from crayppy pls and m3u files!

function func(source) {
    if (source.split('.').pop() == "mp3") {mp3 = source; return;}
    var pls = source.search(".pls");
    var m3u = source.search(".m3u");

 if (pls < 0 && m3u < 0) {
        if (source != "") mp3 = source; else unknownError()
        return;
    }

    var handleResponse = function (status, response) {
        //console.log("Status: "+status+" ("+response+")")
        if (status == 200){
        if (m3u > 0){
            var split = response.split(/\r?\n/);
            for(var i = 0; i < split.length; i++){
                if (split[i].search(/http/i) > -1 && split[i].search(/mp3/i) && split[i].search(/#/i) == -1) {
                    //console.log("MP# = "+mp3)
                    var tmp = split[i].replace(/(\r\n|\n|\r)/gm," ");
                    if (tmp !== "") mp3 = tmp; else unknownError()
                }
            }
        }
        else if (pls > 0){
            var split = response.split(/\r?\n/);
            for(var i = 0; i < split.length; i++){
                if (split[i].search(/mp3/i)) var pos = split[i].search(/file1=/i)
                if (pos > -1) {
                    var tmp = split[i].split(/=/);
                    tmp = tmp[1].replace(/(\r\n|\n|\r)/gm," ");
                    if (tmp !== "") mp3 = tmp; else unknownError()
                }
            }
        } else {
            var tmp = split[i].replace(/(\r\n|\n|\r)/gm," ");
            if (tmp !== "") mp3 = tmp; else unknownError()
        }
    } else {unknownError()}
    }
    var handleStateChange = function () {
       switch (xmlhttp.readyState) {
          case 0 : //console.log("readyState: 0");// UNINITIALIZED
          case 1 : //console.log("readyState: 1");// LOADING
          case 2 : //console.log("readyState: 2");// LOADED
          case 3 : //console.log("readyState: 3");// INTERACTIVE
          break;
          case 4 : //console.log("readyState: 4");// COMPLETED
          handleResponse(xmlhttp.status, xmlhttp.responseText);
          break;
          default: unknownError();//console.log("Error!!!");

       }
    }
    var xmlhttp=new XMLHttpRequest();
    xmlhttp.onreadystatechange=handleStateChange;
    xmlhttp.open("GET",source,true);
    xmlhttp.send(null);
}
