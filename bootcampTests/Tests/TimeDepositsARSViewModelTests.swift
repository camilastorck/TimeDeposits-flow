//
//  TimeDepositsARSViewModelTests.swift
//  bootcampTests
//
//  Created by Camila Storck on 29/12/2022.
//

import Quick
import Nimble
import RxTest
import RxBlocking
@testable import bootcamp

class TimeDepositsARSViewModelSpecs: QuickSpec {
    
    override func spec() {
        
        var sut: TimeDepositsARSViewModel!
        let accountVMFake = AccountViewModelFake()
        let accountFake = AccountFake()
        var scheduler: TestScheduler!
        
        describe("Time Deposits ARS View Model") {
            
            beforeEach {
                sut = TimeDepositsARSViewModel(accountVM: accountVMFake)
                scheduler = TestScheduler(initialClock: 0)
            }
            
            afterEach {
                sut = nil
                accountVMFake.fetchDataCalled = false
                scheduler = nil
            }
            
            context("Time deposits request response is empty") {
                
                beforeEach {
                    accountVMFake.response = []
                }
                
                it("Expect empty array") {
                    let observer = scheduler.createObserver([TimeDeposit].self)
                    let _ = sut.timeDeposits.bind(to: observer)
                    scheduler.start()
                    sut.getTimeDeposits()
                    expect(observer.events).to(equal([.next(0, [TimeDeposit]()), .next(0, []), .completed(0)]))
                }
                
                it("Fetch data called") {
                    sut.getTimeDeposits()
                    expect(accountVMFake.fetchDataCalled).to(beTrue())
                }
            }
            
            context("Time deposits request response is correct") {
                
                beforeEach {
                    accountVMFake.response = accountFake.accounts
                }
                
                it("Expect time deposits array") {
                    let timeDeposits = accountFake.accounts.first!.timeDeposits
                    let observer = scheduler.createObserver([TimeDeposit].self)
                    let _ = sut.timeDeposits.bind(to: observer)
                    scheduler.start()
                    sut.getTimeDeposits()
                    expect(observer.events).to(equal([.next(0, [TimeDeposit]()), .next(0, timeDeposits), .completed(0)]))
                }
                
                it("Fetch data called") {
                    sut.getTimeDeposits()
                    expect(accountVMFake.fetchDataCalled).to(beTrue())
                }
            }
        }
    }
}

extension TimeDeposit: Equatable {
    
    public static func == (lhs: TimeDeposit, rhs: TimeDeposit) -> Bool {
        return lhs.id == rhs.id
    }
}
