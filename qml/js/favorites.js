// Database should be updated to contain location and tags.

var db = undefined;
/* function settings_db_open() {
    if (db == undefined)
        db = LocalStorage.openDatabaseSync("harbour-allradio", "1.1", "StorageDatabase", 100000);

    return db;
} */

function initialize() {
    if (db == undefined)
        db = LocalStorage.openDatabaseSync("harbour-allradio", "", "StorageDatabase", 100000);
    if(db.version === '') {
        db.changeVersion('', '1.1', function(tx) {   // id, lastchangetime, source, title, site, tags, icon, codec, bitrate
            tx.executeSql('CREATE TABLE IF NOT EXISTS channels(id INTEGER, lastchangetime STRING, source TEXT UNIQUE, title TEXT, site TEXT, tags TEXT, icon TEXT, codec TEXT, bitrate TEXT)');
            console.log("CREATE TABLE IF NOT")
        });
    } else if(db.version !== '1.1') {
        db.changeVersion('1.0', '1.1', function(tx)
        {
            tx.executeSql("ALTER TABLE channels RENAME TO old_channels;");
            tx.executeSql('CREATE TABLE IF NOT EXISTS channels(id INTEGER, lastchangetime STRING, source TEXT UNIQUE, title TEXT, site TEXT, tags TEXT, icon TEXT, codec TEXT, bitrate TEXT)');
            console.log("CREATE TABLE IF NOT <> 1.1")

            var rs = tx.executeSql('SELECT * FROM old_channels;');
            for(var i = 0; i < rs.rows.length; i++)
            {
                tx.executeSql('INSERT INTO channels VALUES (?,?,?,?,?,?,?,?,?);', [0, "*", rs.rows.item(i).source, rs.rows.item(i).title, rs.rows.item(i).site, rs.rows.item(i).section, rs.rows.item(i).icon, "", "old"])
            }
            tx.executeSql("DROP TABLE IF EXISTS old_channels");
        });
    }
}

/* function loadWakeup(model,source)
{
    model.clear()
    db.transaction(function(tx)
    {
        var rs = tx.executeSql('SELECT '+source+' FROM channels');
            model.append({"id" : rs.rows.item(i).source,"id" : rs.rows.item(i).source,"lastchangetime" : rs.rows.item(i).lastchangetime,"source" : rs.rows.item(i).source, "title" : rs.rows.item(i).title,"site" : rs.rows.item(i).site,"tags" : rs.rows.item(i).tags,"icon" : rs.rows.item(i).icon,  "codec" : rs.rows.item(i).codec, "bitrate" : rs.rows.item(i).bitrate})
    });

} */

function load(model)
{
    model.clear()

    if (db == undefined)
        db = LocalStorage.openDatabaseSync("harbour-allradio", "1.1", "StorageDatabase", 100000);

    db.transaction(function(tx)
    {
        var rs = tx.executeSql('SELECT * FROM channels ORDER BY icon, title');
        for(var i = 0; i < rs.rows.length; i++)
        {
            model.append({"id" : rs.rows.item(i).id,"lastchangetime" : rs.rows.item(i).lastchangetime,"source" : rs.rows.item(i).source, "title" : rs.rows.item(i).title,"site" : rs.rows.item(i).site,"tags" : rs.rows.item(i).tags,"icon" : rs.rows.item(i).icon,  "codec" : rs.rows.item(i).codec, "bitrate" : rs.rows.item(i).bitrate})
        }
    });
}

function add(id, lastchangetime, source, title, site, tags, icon, codec, bitrate) // id, lastchangetime, source, title, site, tags, icon, codec, bitrate
{
    if (db == undefined)
        db = LocalStorage.openDatabaseSync("harbour-allradio", "1.1", "StorageDatabase", 100000);
    icon = icon.toLowerCase()
    try {
        db.transaction(function(tx)
        {
            tx.executeSql('INSERT INTO channels VALUES (?,?,?,?,?,?,?,?,?);', [id, lastchangetime, source, title, site, tags, icon, codec, bitrate])
        });
    }
    catch(a)
    {
        console.log("insert failed, probably already exists");
    }
}

function update(oldsource,id,lastchangetime, source, title, site, tags, icon, codec, bitrate)
{
    if (db == undefined)
        db = LocalStorage.openDatabaseSync("harbour-allradio", "1.1", "StorageDatabase", 100000);
    icon = icon.toLowerCase()
    db.transaction(function(tx)
    {
        // sqlite> UPDATE COMPANY SET ADDRESS = 'Texas' WHERE ID = 6;
       //if (oldsource == source)
        //tx.executeSql('UPDATE channels SET title=?,site=?,tags=?,icon=?,old=?,codec=?,bitrate=?,id=?;', [title, site, tags, icon, old, codec, bitrate, id],' WHERE source=?', [oldsource])
       // else
     //   tx.executeSql('DELETE FROM channels WHERE source = ?', [oldsource])
     //   tx.executeSql('UPDATE channels SET id=?,lastchangetime=?,source=?,title=?,site=?,tags=?,icon=?,codec=?,bitrate=?;', [id,lastchangetime,source, title, site, tags, icon, codec, bitrate],' WHERE source=?', [oldsource])
    });
}

function del(source)
{
    if (db == undefined)
        db = LocalStorage.openDatabaseSync("harbour-allradio", "1.1", "StorageDatabase", 100000);
    db.transaction(function(tx)
    {
        try {
            tx.executeSql('DELETE FROM channels WHERE source=?', [source])
        }
        catch(a)
        {
            console.log("Delete failed...");
        }
    });
}

function drop()
{
    if (db == undefined)
        db = LocalStorage.openDatabaseSync("harbour-allradio", "1.1", "StorageDatabase", 100000);
    db.transaction(function(tx)
    {
        tx.executeSql("DROP TABLE IF EXISTS channels");
    });
}



