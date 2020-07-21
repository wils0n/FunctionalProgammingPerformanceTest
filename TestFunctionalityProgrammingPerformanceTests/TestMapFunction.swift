//
//  TestFunctionalityProgrammingPerformanceTests.swift
//  TestFunctionalityProgrammingPerformanceTests
//
//  Created by Wilson on 6/28/20.
//  Copyright © 2020 NinjaLabs. All rights reserved.
//

import XCTest
@testable import TestFunctionalityProgrammingPerformance

class TestFunctionalityProgrammingPerformanceTests: XCTestCase {
    private let input = stride(from: 0, to: 10_000_000, by: 1)

   override class var defaultPerformanceMetrics: [XCTPerformanceMetric] {
       return [
           XCTPerformanceMetric("com.apple.XCTPerformanceMetric_TransientHeapAllocationsKilobytes"),
           .wallClockTime
       ]
   }

    func testLoopformance() {
        var newNumbers = [Int]()
        self.measure {
            for number in input {
                let newNumber = number * number
                newNumbers.append(newNumber)
            }
        }
    }

    func testMapPerformance() {
        self.measure {
            let newNumbers = input.map(square)
        }
    }
    
    
    func square(number:Int) -> Int {
        return number * number
    }


}
