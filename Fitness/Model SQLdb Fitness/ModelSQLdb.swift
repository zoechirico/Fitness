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

func GetCount() -> Int64 {
    
    var result:Int64 = 0
    let db = SQLdb()
    db.open("push-ups")
    db.create()
    
    
    let r = db.count()
    
    
    for (_ , item) in r.enumerated() {
        print("\(item)")
        result = item
    }
    
    db.close()
    
    return result
}

func GetSitup() -> Int64 {
    
    var result:Int64 = 0
    let db = SQLdb()
    db.open("push-ups")
    db.create()
    
    
    let r = db.resultNI(sql: "select t1key, data, num, timeEnter from situps where timeEnter > date('now','-17 hour');")

    for (_ , item) in r.enumerated() {
        print("\(item.t1key),\t \(item.data), \(item.num),  timeEnter: \(item.timeEnter)")
        result+=1
    }
    
    db.close()
    
    
    return result
}
