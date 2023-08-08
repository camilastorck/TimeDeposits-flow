//
//  ConfirmationControllerTests.swift
//  bootcampTests
//
//  Created by Camila Storck on 29/12/2022.
//

import XCTest
@testable import bootcamp

class ConfirmationControllerTests: XCTestCase {
    
    var sut: ConfirmationController!
    let timeDepositOptionFake = TimeDepositOptionsFake()
    let accountVMFake = AccountViewModelFake()
    let accountFake = AccountFake()
    
    override func setUp() {
        sut = ConfirmationController(accountVM: accountVMFake, timeDepositOptionSelected: timeDepositOptionFake.timeDepositOption, amount: 60000)
    }
    
    override func tearDown() {
        sut = nil
        accountVMFake.fetchDataCalled = false
    }
    
    func test_AccountId_IsValid() {
        accountVMFake.response = accountFake.accounts
        sut.loadViewIfNeeded()
        
        XCTAssertTrue(accountVMFake.fetchDataCalled)
        XCTAssertFalse(sut.accountId.isEmpty)
        XCTAssertEqual(sut.accountId, "2322")
        XCTAssert(type(of: sut.accountId) == String.self)
    }
    
    func test_AccountBalance_IsValid() {
        accountVMFake.response = accountFake.accounts
        sut.loadViewIfNeeded()
        
        XCTAssertTrue(accountVMFake.fetchDataCalled)
        XCTAssertEqual(sut.balance, 102051582)
        XCTAssert(type(of: sut.balance) == Int.self)
    }
}
