//
//  ConfirmationViewModelTests.swift
//  bootcampTests
//
//  Created by Camila Storck on 29/12/2022.
//

import Quick
import Nimble
@testable import bootcamp

class ConfirmationViewModelSpecs: QuickSpec {
    
    override func spec() {
        
        var sut: ConfirmationViewModel!
        let timeDepositOptionsFake = TimeDepositOptionsFake()
        var amountLabelValue: String!
        var investedAmountLabelValue: String!
        var interestGainedAmountLabelValue: String!
        var TNAAmountLabelValue: String!
        
        describe("Confirmation View Model") {
            
            context("Label") {

                beforeEach {
                    sut = ConfirmationViewModel(timeDepositOption: timeDepositOptionsFake.timeDepositOption, amount: 80000)
                    amountLabelValue = "$ 82.630,14"
                    investedAmountLabelValue = "$ 80.000"
                    interestGainedAmountLabelValue = "$ 2.630,14"
                    TNAAmountLabelValue = "40%"
                }
                
                afterEach {
                    sut = nil
                }
                
                it("Amount should be correct") {
                    expect(sut.amountLabel).to(equal(amountLabelValue))
                }
                
                it("Amount should not be empty") {
                    expect(sut.amountLabel).notTo(beEmpty())
                }
                
                it("Invested amount should be correct") {
                    expect(sut.investedAmountLabel).to(equal(investedAmountLabelValue))
                }
                
                it("Invested amount should not be empty") {
                    expect(sut.investedAmountLabel).notTo(beEmpty())
                }
                
                it("Interest gained amount should be correct") {
                    expect(sut.interestGainedAmountLabel).to(equal(interestGainedAmountLabelValue))
                }
                
                it("Interest gained amount should not be empty") {
                    expect(sut.interestGainedAmountLabel).notTo(beEmpty())
                }
                
                it("TNA amount should be correct") {
                    expect(sut.TNAAmountLabel).to(equal(TNAAmountLabelValue))
                }
                
                it("TNA amount should not be empty") {
                    expect(sut.TNAAmountLabel).notTo(beEmpty())
                }
            }
        }
    }
}
