//
//  DeOfHetTests.swift
//  DeOfHetTests
//
//  Created by Prajakta Kulkarni on 23/02/2019.
//  Copyright © 2019 Prajakta Kulkarni. All rights reserved.
//

import XCTest

@testable import DeOfHet

class DeOfHetTests: XCTestCase {
    var testDeOfHet:PracticeViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testSetInitialArrayOfObjects(){
        //given
        testDeOfHet = PracticeViewController()
        //when
        testDeOfHet.SetIntialArrayOfObjects()
        //then
        XCTAssertNotNil(testDeOfHet.objects)
    }

    func testGetRandomObject(){
        //given
        testDeOfHet = PracticeViewController()
        testDeOfHet.SetIntialArrayOfObjects()
        //when
        let obj = testDeOfHet.getRandomObject()
        //then
        XCTAssertNotNil(obj)
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
