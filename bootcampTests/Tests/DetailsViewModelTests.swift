//
//  DetailsViewModelTests.swift
//  bootcampTests
//
//  Created by Camila Storck on 28/12/2022.
//

import Quick
import Nimble
import RxBlocking
@testable import bootcamp

class DetailsViewModelSpecs: QuickSpec {
    
    override func spec() {
        var sut: DetailsViewModel!
        let timeDepositOptionsVMFake = TimeDepositOptionsViewModelFake()
        let timeDepositOptionsFake = TimeDepositOptionsFake()
        
        describe("Details View Model") {
            
            context("Request response") {
                
                beforeEach {
                    sut = DetailsViewModel(timeDepositOptionsVM: timeDepositOptionsVMFake)
                }
                
                afterEach {
                    sut = nil
                }
                
                it("Time Deposits Options Array should be empty when request response is empty") {
                    timeDepositOptionsVMFake.response = []
                    let options = try sut.getTimeDepositsOptions(for: 50000).toBlocking().first()!
                    expect(options.count).to(equal(0))
                }
                
                it("Time Deposit Options currency should be ARS") {
                    timeDepositOptionsVMFake.response = timeDepositOptionsFake.timeDepositOptions
                    let amount: Int = 1000
                    let options = try sut.getTimeDepositsOptions(for: amount).toBlocking().first()!
                    options.forEach { expect($0.currency).to(equal(.ars)) }
                }
                
                it("Time Deposit Options currency should not be USD") {
                    timeDepositOptionsVMFake.response = timeDepositOptionsFake.timeDepositOptions
                    let amount: Int = 500
                    let options = try sut.getTimeDepositsOptions(for: amount).toBlocking().first()!
                    options.forEach { expect($0.currency).notTo(equal(.usd)) }
                }
                
                context("Time deposit options") {
                    
                    var minOptions: [TimeDepositOption]!
                    var largeOptions: [TimeDepositOption]!
                    let minAmount: Int = 500
                    let largeAmount: Int = 500000
                    
                    beforeEach {
                        timeDepositOptionsVMFake.response = timeDepositOptionsFake.timeDepositOptions
                        minOptions = try! sut.getTimeDepositsOptions(for: minAmount).toBlocking().first()!
                        largeOptions = try! sut.getTimeDepositsOptions(for: largeAmount).toBlocking().first()!
                    }
                    
                    it("Min amount should be less or equal to amount") {
                        let minAmountFiltered = minOptions.map(\.minAmountFormatted).sorted(by: <).first
                        expect(minAmountFiltered).to(beLessThanOrEqualTo(minAmount))
                    }
                    
                    it("Max amount should be greater than or equal to amount") {
                        let maxAmountFiltered = largeOptions.map(\.maxAmountFormatted).sorted(by: >).first
                        expect(maxAmountFiltered).to(beGreaterThanOrEqualTo(largeAmount))
                    }
                }
            }
        }
    }
}
