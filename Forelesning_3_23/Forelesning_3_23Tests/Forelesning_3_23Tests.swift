//
//  Forelesning_3_23Tests.swift
//  Forelesning_3_23Tests
//
//  Created by Håkon Bogen on 04/09/2023.
//

import XCTest
@testable import Forelesning_3_23

final class Forelesning_3_23Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample(){
        let json = Product.sampleJSON
        let decoder = JSONDecoder()
        do {
            let product = try decoder.decode(Product.self, from: json.data(using: .utf8)!)
            
            XCTAssertEqual(product.name, "Bukse")
            XCTAssertEqual(product.description, "Grå, str 32")
            XCTAssertEqual(product.price, 500)
        } catch let error {
            XCTFail(error.localizedDescription)
        }
//        let product = Product.ID
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
