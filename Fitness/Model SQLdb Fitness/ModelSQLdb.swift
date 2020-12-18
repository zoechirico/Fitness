//
//  ModelSQLdb.swift
//  Fitness
//
//  Created by Mike Chirico on 12/18/20.
//

import Foundation
import UIKit


func AddEntry(txt: String) {
    let db = SQLdb()
    db.open("push-ups")
    db.create()
    
    guard let  image = db.img(color: UIColor.green,size: CGSize(width: 20,height: 20)) else {
        print("Can't create image.")
        return
    }
    
    db.insert(data: txt, image: image, num: 17.8)
    
    let r = db.result()
    

    for (_ , item) in r.enumerated() {
        print("\(item.t1key),\t \(item.data), \(item.num), \(item.timeEnter)")
    }
    
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
