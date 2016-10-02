var db = undefined;
function settings_db_open() {
    if (db == undefined)
        db = LocalStorage.openDatabaseSync("harbour-allradio", "1.0", "StorageDatabase", 100000);

    return db;
}

function initialize() {
    db = settings_db_open();
    db.transaction(
        function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS channels(backend INTEGER, grid INTEGER)');
      });

}

function load(model)
{
    model.clear()
    db.transaction(function(tx)
    {
        var rs = tx.executeSql('SELECT * FROM channels ORDER BY icon, title');
        for(var i = 0; i < rs.rows.length; i++)
        {
            model.append({"source" : rs.rows.item(i).source, "title" : rs.rows.item(i).title,"site" : rs.rows.item(i).site,"section" : rs.rows.item(i).section,"icon" : rs.rows.item(i).icon, "old" : rs.rows.item(i).old, "codec" : rs.rows.item(i).codec, "bitrate" : rs.rows.item(i).bitrate})
        }
    });
}
