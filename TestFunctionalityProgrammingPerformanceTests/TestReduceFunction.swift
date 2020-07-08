//
//  TestReduceFunction.swift
//  TestFunctionalityProgrammingPerformanceTests
//
//  Created by Wilson on 7/5/20.
//  Copyright © 2020 NinjaLabs. All rights reserved.
//

import XCTest

class TestReduceFunction: XCTestCase {

    private let input = stride(from: 0, to: 10_000_000, by: 1)

    override class var defaultPerformanceMetrics: [XCTPerformanceMetric] {
        return [
            XCTPerformanceMetric("com.apple.XCTPerformanceMetric_TransientHeapAllocationsKilobytes"),
            .wallClockTime
        ]
    }
    
    func testLoopToReducePerformance () {
        // This is an example of a performance test case.
        var sum = 0
        self.measure {
            for number in input {
                sum += number
            }
            print(sum)
        }
    }

    func testReducePerformance() {
        // This is an example of a performance test case.
        self.measure {
            let sum = input.reduce(0, reduceSum)
            print(sum)
        }
    }

    func reduceSum (sum: Int, element: Int) -> Int {
        return sum + element
    }

}
