//
//  ModelSQLdbTests.swift
//  FitnessTests
//
//  Created by Mike Chirico on 12/19/20.
//

import XCTest

class ModelSQLdbTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let db = SQLdb()
        db.open("push-ups")
        db.sql(sql: "drop TABLE IF EXISTS  situps;")
        db.sql(sql: "drop TRIGGER IF EXISTS insert_situps_timeEnter;")
        
        AddSitup()
        
        let r = db.resultNI(sql: "select t1key, data, num, timeEnter from situps;")
        XCTAssertTrue(r.count == 1)
        for (_ , item) in r.enumerated() {
            print("\(item.t1key),\t \(item.data), \(item.num),  timeEnter: \(item.timeEnter)")
        }
        
        db.close()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
