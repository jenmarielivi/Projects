//
//  AnimalCrossing_APIUITests.swift
//  AnimalCrossing_APIUITests
//
//  Created by Consultant on 8/8/22.
//

import XCTest
@testable import AnimalCrossing_API
class ACViewModeltest: XCTestCase {

    var viewModel: ACViewModel?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.viewModel = ACViewModel()
    
    }

    override func tearDownWithError() throws {
        
        self.viewModel = nil
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRequestModelDataSuccess() throws {
        // Arrange
        let expectation = XCTestExpectation(description: "Successfully retrieving Models")
        
        // Act
        self.viewModel?.bind {
            expectation.fulfill()
        }
        self.viewModel?.fetchACPage()
        wait(for: [expectation], timeout: 3)
        
        // Assert
        XCTAssertEqual(self.viewModel?.count, 20)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

    
}



