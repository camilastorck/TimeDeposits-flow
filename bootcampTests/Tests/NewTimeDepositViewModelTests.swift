//
//  NewTimeDepositViewModelTests.swift
//  bootcampTests
//
//  Created by Agustin Errecalde on 15/06/2021.
//

import Quick
import Nimble
import RxTest
@testable import bootcamp

class NewTimeDepositViewModelSpecs: QuickSpec {
    
    override func spec() {
        
        var sut: NewTimeDepositViewModel!
        var scheduler: TestScheduler!
        
        describe("New Time Deposit View Model") {
            
            beforeEach {
                sut = NewTimeDepositViewModel()
                scheduler = TestScheduler(initialClock: 0)
            }
            
            afterEach {
                sut = nil
                scheduler = nil
            }
            
            context("Validate amount") {
                
                it("Amount not allowed") {
                    let amountBelow: String = "300"
                    let amountBelowIsValid: Bool = sut.isValidAmount(amountBelow)
                    expect(amountBelowIsValid).to(beFalse())
                }
                
                it("Min amount allowed") {
                    let amountMin: String = "500"
                    let amountMinIsValid: Bool = sut.isValidAmount(amountMin)
                    expect(amountMinIsValid).to(beTrue())
                }
                
                it("Large amount allowed") {
                    let amountAbove: String = "10000"
                    let amountAboveIsValid: Bool = sut.isValidAmount(amountAbove)
                    expect(amountAboveIsValid).to(beTrue())
                }
                
                it("Invalid amount") {
                    let invalidInput: String = "123%"
                    let invalidInputIsValid: Bool = sut.isValidAmount(invalidInput)
                    expect(invalidInputIsValid).to(beFalse())
                }
            }
            
            context("Behaviour Subjects State") {
                
                it("Main button is hidden") {
                    let observable = scheduler.createColdObservable([.next(1, ""), .next(2, "0"), .next(3, "-230"), .next(4, "530")])
                    let observer = scheduler.createObserver(Bool.self)
                    let _ = sut.isHidden.bind(to: observer)
                    let _ = observable.bind(to: sut.value)
                    scheduler.start()
                    expect(observer.events).to(equal([.next(0, true), .next(1, true), .next(2, false), .next(3, false), .next(4, false)]))
                }
                
                it("Amount formatted value") {
                    let observable = scheduler.createColdObservable([.next(1, ""), .next(2, "0"), .next(3, "23900"), .next(4, "5098730")])
                    let observer = scheduler.createObserver(String.self)
                    let _ = sut.formattedValue.bind(to: observer)
                    let _ = observable.bind(to: sut.value)
                    scheduler.start()
                    expect(observer.events).to(equal([.next(0, "0"), .next(1, "0"), .next(2, "0"), .next(3, "23.900"), .next(4, "5.098.730")]))
                }
            }
        }
    }
}
