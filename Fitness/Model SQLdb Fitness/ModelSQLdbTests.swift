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
    
    func test_SitUp() throws {
        
        let db = SQLdb()
        
        let database = "test.sqlite"
        
        db.open(database)
        db.sql(sql: "drop TABLE IF EXISTS  SitUp;")
        db.sql(sql: "drop TRIGGER IF EXISTS insert_SitUp_timeEnter;")
        var result  = GetCount(table: "SitUp",database: database)
        XCTAssertTrue(result == 0)
        AddSitUp()
        result  = GetCount(table: "SitUp",database: database)
        XCTAssertTrue(result == 0)
        
        db.close()
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
