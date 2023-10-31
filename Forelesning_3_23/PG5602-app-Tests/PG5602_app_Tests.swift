//
//  Forelesning_3_23Tests.swift
//  Forelesning_3_23Tests
//
//  Created by Håkon Bogen on 04/09/2023.
//

import XCTest
@testable import pg6502_app

final class PG5602_app_Tests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidProductFromJSON() {
        let json = Product.sampleJSON
        let decoder = JSONDecoder()
        do {
            let product = try decoder.decode(Product.self, from: json.data(using: .utf8)!)
            
            XCTAssertEqual(product.name, "Bukse")
            XCTAssertEqual(product.description, "Grå, str 32")
            XCTAssertEqual(product.price, 500)
            XCTAssertEqual(product.images.count, 1)
            let productImage = product.images.first
            XCTAssertEqual(productImage?.url, "https://google.com")
            XCTAssertEqual(productImage?.description, "Buksa i grønn versjon")
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testInvalidJSON() {
        let json = """
         {
             "name": "Bukse",
             "desc": "Grå, str 32"
         }
         """
        let decoder = JSONDecoder()
        do {
            let _ = try decoder.decode(Product.self, from: json.data(using: .utf8)!)
            XCTFail("Should not make a product without price!")
        } catch {
            
        }
    }
    
    func testAnotherProductFromJSON() throws {
        let json = """
 {
       "name" : "Genser",
       "desc" : "Grå, str 231",
       "price" : 421,
       "product_images" : [{
            "url": "google.com",
            "description":  "fin genser"
       }]
}
"""
        let _ = try JSONDecoder().decode(Product.self, from: json.data(using: .utf8)!)
    }
    
    func testPerformanceExample() throws {
        
    }
    
}
