//
//  NewTimeDepositControllerTests.swift
//  bootcampTests
//
//  Created by Camila Storck on 30/12/2022.
//

import Quick
import Nimble
@testable import bootcamp

class NewTimeDepositControllerSpecs: QuickSpec {
    
    override func spec() {
        
        var sut: NewTimeDepositController!
        let accountVMFake = AccountViewModelFake()
        let accountFake = AccountFake()
        let window = (UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate).window!
        
        describe("New Time Deposit Controller") {
            
            beforeEach {
                sut = NewTimeDepositController(accountVM: accountVMFake)
                accountVMFake.response = accountFake.accounts
                sut.loadViewIfNeeded()
            }
            
            afterEach {
                sut = nil
            }
            
            context("Request response") {
                
                it("Account Id is valid") {
                    expect(sut.accountId).to(equal("2322"))
                }
                
                it("Account Id not empty") {
                    expect(sut.accountId).notTo(beEmpty())
                }
                
                it("Account balance is valid") {
                    expect(sut.balance).to(equal("1.020.515,82"))
                }
                
                it("Account balance not empty") {
                    expect(sut.balance).notTo(beEmpty())
                }
            }
            
            context("Amount text field editing called") {
                
                it("Field text color should change") {
                    sut.newTimeDepositView.timeDepositAmountField.sendActions(for: .editingChanged)
                    expect(sut.newTimeDepositView.timeDepositAmountField.textColor).to(equal(.mainAppColor))
                }
                
                it("Main button should show") {
                    sut.newTimeDepositView.timeDepositAmountField.sendActions(for: .editingChanged)
                    expect(sut.newTimeDepositView.mainButton.isHidden).to(beFalse())
                }
                
                it("Error view should be hidden") {
                    sut.newTimeDepositView.timeDepositAmountField.sendActions(for: .editingChanged)
                    expect(sut.newTimeDepositView.errorView.alpha).to(equal(0))
                }
                
                it("For empty amount") {
                    sut.newTimeDepositView.timeDepositAmountField.text = ""
                    sut.newTimeDepositView.timeDepositAmountField.sendActions(for: .editingChanged)
                    expect(sut.newTimeDepositView.timeDepositAmountField.text).to(equal("0"))
                }
                
                it("For valid amount") {
                    sut.newTimeDepositView.timeDepositAmountField.text = "5000"
                    sut.newTimeDepositView.timeDepositAmountField.sendActions(for: .editingChanged)
                    expect(sut.newTimeDepositView.timeDepositAmountField.text).to(equal("5.000"))
                }
            }
            
            context("Main button tap called") {
                
                it("For valid amount should navigate") {
                    let nav = FakeNavigation(rootViewController: sut)
                    window.rootViewController = nav
                    sut.newTimeDepositView.timeDepositAmountField.text = "500"
                    sut.newTimeDepositView.mainButton.sendActions(for: .touchUpInside)
                    expect(nav.pushCalled).to(beTrue())
                }
                
                it("For invalid amount should show error view") {
                    sut.newTimeDepositView.timeDepositAmountField.text = "20"
                    sut.newTimeDepositView.mainButton.sendActions(for: .touchUpInside)
                    expect(sut.newTimeDepositView.errorView.alpha).to(equal(1))
                }
            }
            
            context("Account balance text field") {
                
                it("FetchData called") {
                    expect(accountVMFake.fetchDataCalled).to(beTrue())
                }
                
                it("Is valid balance amount and format") {
                    let accountBalanceFieldText: String = "SALDO: $ 1.020.515,82"
                    expect(sut.newTimeDepositView.balanceLabel.text).to(equal(accountBalanceFieldText))
                }
                
                it("Is not empty") {
                    expect(sut.newTimeDepositView.balanceLabel.text).notTo(beEmpty())
                }
            }
        }
    }
}

class FakeNavigation: UINavigationController {
    
    var pushCalled: Bool = false
    var pushController: UIViewController!
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushCalled = true
        pushController = viewController
    }
}
