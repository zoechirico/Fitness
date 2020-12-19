//
//  ModelSQLdb.swift
//  Fitness
//
//  Created by Mike Chirico on 12/18/20.
//

import Foundation
import UIKit


func AddSitup() {
    let db = SQLdb()
    db.open("push-ups")
    
    let sql = """
    CREATE TABLE IF NOT EXISTS situps (t1key INTEGER
              PRIMARY KEY,data text,num double,timeEnter DATE);
    CREATE TRIGGER IF NOT EXISTS insert_situps_timeEnter AFTER  INSERT ON situps
      BEGIN
        UPDATE situps SET timeEnter = DATETIME('NOW')  WHERE rowid = new.rowid;
      END;
    """
    
    db.sql(sql: sql)
    db.sql(sql: "insert into situps (data,num) values ('situps',1.0);")
    db.close()

}

func AddKettleBell() {
    let db = SQLdb()
    db.open("push-ups")
    
    let sql = """
    CREATE TABLE IF NOT EXISTS KettleBell (t1key INTEGER
              PRIMARY KEY,data text,num double,timeEnter DATE);
    CREATE TRIGGER IF NOT EXISTS insert_KettleBell_timeEnter AFTER  INSERT ON KettleBell
      BEGIN
        UPDATE KettleBell SET timeEnter = DATETIME('NOW')  WHERE rowid = new.rowid;
      END;
    """
    
    db.sql(sql: sql)
    db.sql(sql: "insert into KettleBell (data,num) values ('KettleBell',1.0);")
    db.close()

}



func AddEntry(txt: String) {
    let db = SQLdb()
    db.open("push-ups")
    db.create()
    
    guard let  image = db.img(color: UIColor.green,size: CGSize(width: 20,height: 20)) else {
        print("Can't create image.")
        return
    }
    
    db.insert(data: txt, image: image, num: 17.8)
    
    db.close()
}

/*
t0
situps
KettleBell
 */
func GetCount(table:String = "t0") -> Int64 {
    
    var result:Int64 = 0
    let db = SQLdb()
    db.open("push-ups")
    db.create()
    
    
    let r = db.resultNI(sql: "select t1key, data, num, timeEnter from \(table) where timeEnter > date('now','-17 hour');")

    for (_ , item) in r.enumerated() {
        result+=1
    }
    
    db.close()
    
    return result
}
