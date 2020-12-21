//
//  ModelSQLdb.swift
//  Fitness
//
//  Created by Mike Chirico on 12/18/20.
//

import Foundation
import UIKit

class WorkoutDisplay: ObservableObject {
    @Published var display = "Push Ups: \(GetCount(table: "PushUp"))\nSit Ups:  \(GetCount(table: "SitUp"))\nKettleBell:  \(GetCount(table: "KettleBell"))"
}



func AddSitUp(num: Double = 1.0) {
    let db = SQLdb()
    db.open("workout.sqlite")
    
    let sql = """
    CREATE TABLE IF NOT EXISTS SitUp (t1key INTEGER
              PRIMARY KEY,data text,num double,timeEnter DATE);
    CREATE TRIGGER IF NOT EXISTS insert_SitUp_timeEnter AFTER  INSERT ON SitUp
      BEGIN
        UPDATE SitUp SET timeEnter = DATETIME('NOW')  WHERE rowid = new.rowid;
      END;
    """
    
    db.sql(sql: sql)
    db.sql(sql: "insert into SitUp  (data,num) values ('situps',\(num));")
    db.close()

}

func AddKettleBell(num: Double = 1.0) {
    let db = SQLdb()
    db.open("workout.sqlite")
    
    let sql = """
    CREATE TABLE IF NOT EXISTS KettleBell (t1key INTEGER
              PRIMARY KEY,data text,num double,timeEnter DATE);
    CREATE TRIGGER IF NOT EXISTS insert_KettleBell_timeEnter AFTER  INSERT ON KettleBell
      BEGIN
        UPDATE KettleBell SET timeEnter = DATETIME('NOW')  WHERE rowid = new.rowid;
      END;
    """
    
    db.sql(sql: sql)
    db.sql(sql: "insert into KettleBell (data,num) values ('KettleBell',\(num));")
    db.close()

}

func AddPushUp(num: Double = 1.0) {
    let db = SQLdb()
    db.open("workout.sqlite")
    
    let sql = """
    CREATE TABLE IF NOT EXISTS PushUp (t1key INTEGER
              PRIMARY KEY,data text,num double,timeEnter DATE);
    CREATE TRIGGER IF NOT EXISTS insert_PushUp_timeEnter AFTER  INSERT ON PushUp
      BEGIN
        UPDATE PushUp SET timeEnter = DATETIME('NOW')  WHERE rowid = new.rowid;
      END;
    """
    
    db.sql(sql: sql)
    db.sql(sql: "insert into PushUp (data,num) values ('PushUp',\(num));")
    db.close()

}



func AddEntry(txt: String) {
    let db = SQLdb()
    db.open("workout.sqlite")
    db.create()
    
    guard let  image = db.img(color: UIColor.green,size: CGSize(width: 20,height: 20)) else {
        print("Can't create image.")
        return
    }
    
    db.insert(data: txt, image: image, num: 17.8)
    
    db.close()
}


func DeleteAll() {
    let db = SQLdb()
    
    let database = "workout.sqlite"
    
    db.open(database)
    
    db.sql(sql: "drop TABLE IF EXISTS  PushUp;")
    db.sql(sql: "drop TRIGGER IF EXISTS insert_PushUp_timeEnter;")
    
    db.sql(sql: "drop TABLE IF EXISTS  SitUp;")
    db.sql(sql: "drop TRIGGER IF EXISTS insert_SitUp_timeEnter;")
    
    db.sql(sql: "drop TABLE IF EXISTS  KettleBell;")
    db.sql(sql: "drop TRIGGER IF EXISTS insert_KettleBell_timeEnter;")


    
    
    db.close()
}



/*
PushUp
SitUp
KettleBell
 */
func GetCount(table:String = "t0",database: String = "workout.sqlite") -> Int64 {
    
    var result:Int64 = 0
    let db = SQLdb()
    db.open(database)
    db.create()
    
    
    let r = db.resultNI(sql: "select t1key, data, num, timeEnter from \(table) where timeEnter > date('now','-17 hour') order by timeEnter desc;")

    for (_ , item) in r.enumerated() {
        print("\(item.t1key), \(item.timeEnter)")
        result+=1
    }
    
    db.close()
    
    return result
}
