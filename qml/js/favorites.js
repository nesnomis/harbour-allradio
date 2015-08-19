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
            tx.executeSql('CREATE TABLE IF NOT EXISTS channels(source TEXT UNIQUE, title TEXT, site TEXT, section TEXT, icon TEXT)');
      });

}

function load(model)
{
    model.clear()
    db.transaction(function(tx)
    {
        var rs = tx.executeSql('SELECT * FROM channels ORDER BY icon');
        for(var i = 0; i < rs.rows.length; i++)
        {
            model.append({"source" : rs.rows.item(i).source, "title" : rs.rows.item(i).title,"site" : rs.rows.item(i).site,"section" : rs.rows.item(i).section,"icon" : rs.rows.item(i).icon})
        }
    });
}

function add(source, title, site, section, icon)
{
    settings_db_open();
    try {
        db.transaction(function(tx)
        {
            tx.executeSql('INSERT INTO channels VALUES (?,?,?,?,?);', [source, title, site, section, icon])
        });
    }
    catch(a)
    {
        console.log("insert failed, probably already exists");
    }
}

function update(source, title, site, section, icon)
{
    settings_db_open();
    db.transaction(function(tx)
    {
        tx.executeSql('INSERT OR REPLACE INTO channels VALUES (?,?,?,?,?);', [source, title, site, section, icon])
    });
}

function del(source)
{
    settings_db_open();
    db.transaction(function(tx)
    {
        tx.executeSql('DELETE FROM channels WHERE source = ?', [source])
    });
}

function drop()
{
    settings_db_open();
    db.transaction(function(tx)
    {
        tx.executeSql("DROP TABLE IF EXISTS channels");
    });
}



