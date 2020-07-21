//
//  TestFilterFunction.swift
//  TestFunctionalityProgrammingPerformanceTests
//
//  Created by Wilson on 7/5/20.
//  Copyright © 2020 NinjaLabs. All rights reserved.
//

import XCTest

class TestFilterFunction: XCTestCase {
    private let input = stride(from: 0, to: 10_000_000, by: 1)

    override class var defaultPerformanceMetrics: [XCTPerformanceMetric] {
        return [
            XCTPerformanceMetric("com.apple.XCTPerformanceMetric_TransientHeapAllocationsKilobytes"),
            .wallClockTime
        ]
    }
    
    func testLoopPerformance () {
        var evenNumbers = [Int]()
        self.measure {
            for number in input {
                if (number % 2 == 0) {
                    evenNumbers.append(number)
                }
            }
            print(evenNumbers)
        }
    }
    
    func testFilterPerformance () {
        self.measure {
            let evenNumbers = input.filter(isEven)
            print(evenNumbers)
        }
    }
    
    func isEven(number: Int) -> Bool {
        return number % 2 == 0
    }

}
