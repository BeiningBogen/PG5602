//
//  NettbutikkTests.swift
//  NettbutikkTests
//
//  Created by Håkon Bogen on 04/09/2024.
//

import XCTest
@testable import Nettbutikk

final class NettbutikkTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSupplierHasFlagURL() throws {
        
        let supplier = Supplier.init(id: 3, name: "Klesbutikk", country: "GERMANY", contactInfo: "")
        XCTAssertNotNil(supplier.flagURL)
        XCTAssertEqual(supplier.flagURL, URL(string:"https://flagsapi.com/DE/flat/64.png"))
    }
    
    func testSupplierHasNoFlagURL() throws {
        let supplier = Supplier.init(id: 3, name: "Klesbutikk", country: "N/A", contactInfo: "")
        XCTAssertNil(supplier.flagURL)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
