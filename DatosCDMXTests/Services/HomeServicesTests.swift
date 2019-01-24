//
//  HomeServicesTests.swift
//  DatosCDMXTests
//
//  Created by Luis Arias on 1/24/19.
//  Copyright © 2019 Luis Arias. All rights reserved.
//

import XCTest
@testable import DatosCDMX

class HomeServicesTests: XCTestCase {
  
  var apiClient: ApiClientProtocol?
  
  override func setUp() {
    apiClient = APIClient()
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testCategoriesService() {
    let exp = expectation(description: "Category Expectation")
    apiClient?.getCategories { result in
      switch result {
      case .failure(let error):
        XCTFail(error.localizedDescription)
      case .success(let value):
        XCTAssertNotNil(value.facetGroup.first?.facets?.first)
      }
      exp.fulfill()
    }
    
    waitForExpectations(timeout: 10, handler: nil)
  }
}
