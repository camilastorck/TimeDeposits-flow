//
//  ExtensionTests.swift
//  bootcampTests
//
//  Created by Camila Storck on 02/01/2023.
//

import Quick
import Nimble
@testable import bootcamp

class ExtensionSpecs: QuickSpec {
    
    override func spec() {
        
        describe("Extensions") {
            
            context("Format amount to valid format") {
                
                it("Int small amount") {
                    let firstAmount: Int = 2000
                    let firstAmountFormatted: String = firstAmount.formatToAmount
                    expect(firstAmountFormatted).to(equal("2.000"))
                }
                
                it("Int large amount") {
                    let firstAmount: Int = 5000000
                    let firstAmountFormatted: String = firstAmount.formatToAmount
                    expect(firstAmountFormatted).to(equal("5.000.000"))
                }
                
                it("Double small amount") {
                    let firstAmount: Double = 2314.5636
                    let firstAmountFormatted: String = firstAmount.formatToAmount
                    expect(firstAmountFormatted).to(equal("2.314,56"))
                }
                
                it("Double large amount") {
                    let firstAmount: Double = 1234567.5643
                    let firstAmountFormatted: String = firstAmount.formatToAmount
                    expect(firstAmountFormatted).to(equal("1.234.567,56"))
                }
                
                it("String nil amount") {
                    let numberStringNil: String? = nil
                    let numberStringNilFormatted = formatToNumberString(numberStringNil)
                    expect(numberStringNilFormatted).to(beEmpty())
                }
                
                it("String invalid amount") {
                    let numberStringInvalid: String = "$123"
                    let numberStringInvalidFormatted = formatToNumberString(numberStringInvalid)
                    expect(numberStringInvalidFormatted).to(beEmpty())
                }
            }
            
            context("Format string to valid Int") {
                
                it("Small amount") {
                    let amount: String = "2000"
                    let amountFormatted: Int = amount.formatToInt
                    expect(amountFormatted).to(equal(2000))
                }
                
                it("Large amount") {
                    let amount: String = "5.000.000"
                    let amountFormatted: Int = amount.formatToInt
                    expect(amountFormatted).to(equal(5000000))
                }
                
                it("Invalid amount") {
                    let amount: String = "$5.000"
                    let amountFormatted: Int = amount.formatToInt
                    expect(amountFormatted).to(equal(0))
                }
                
                it("Double amount") {
                    let amount: String = "500,00"
                    let amountFormatted: Int = amount.formatToInt
                    expect(amountFormatted).to(equal(500))
                }
            }
            
            context("Get item from array at index") {
                
                var items: [Int]!
                var emptyItems: [Int]!
                
                beforeEach {
                    items = [2, 5, 8, 0, 9]
                    emptyItems = []
                }
                
                it("Should get valid item") {
                    let item = items.get(at: 2)
                    expect(item).to(equal(8))
                }
                
                it("Should get nil item") {
                    let item = items.get(at: 7)
                    expect(item).to(beNil())
                }
                
                it("Should get nil item from empty array") {
                    let item = emptyItems.get(at: 0)
                    expect(item).to(beNil())
                }
            }
            
            context("Format string to full date") {
                
                it("Should get valid date") {
                    let date = "2023-01-16"
                    let dateFormatted = date.formatToFullDateString
                    expect(dateFormatted).to(equal("16 de enero de 2023"))
                }
                
                it("Invalid string should get empty date") {
                    let date = "2023-03-0"
                    let dateFormatted = date.formatToFullDateString
                    expect(dateFormatted).to(beEmpty())
                }
                
                it("Empty string should get empty date") {
                    let date = ""
                    let dateFormatted = date.formatToFullDateString
                    expect(dateFormatted).to(beEmpty())
                }
            }
            
            context("Calculate amounts for time deposit") {
                
                it("Should return interest gained for valid amounts") {
                    let value: Double = interestGained(for: 0.013, and: 50000)
                    expect(value).to(equal(650))
                }
                
                it("Should return interest gained for zero rate") {
                    let value: Double = interestGained(for: 0, and: 2000)
                    expect(value).to(equal(0))
                }
                
                it("Should return interest gained for zero amount") {
                    let value: Double = interestGained(for: 0.012, and: 0)
                    expect(value).to(equal(0))
                }
                
                it("Should return final amount for valid amounts") {
                    let value: Double = finalAmount(for: 0.024, and: 60000)
                    expect(value).to(equal(61440))
                }
                
                it("Should return final amount for zero rate") {
                    let value: Double = finalAmount(for: 0, and: 21000)
                    expect(value).to(equal(21000))
                }
                
                it("Should return final amount for zero amount") {
                    let value: Double = finalAmount(for: 0.021, and: 0)
                    expect(value).to(equal(0))
                }
            }
            
            context("Get valid info from Bundle") {
                
                var userIdFromBundle: String!
                var pathFromBundle: String!
                
                beforeEach {
                    userIdFromBundle = Bundle.main.userIdHOMO
                    pathFromBundle = Bundle.main.pathHOMO
                }
                
                it("Should get valid userId") {
                    let userId: String = "bed65903-c976-4a8f-a4ea-35c993600915"
                    expect(userIdFromBundle).to(equal(userId))
                }
                
                it("Should get valid userId") {
                    expect(userIdFromBundle).notTo(beEmpty())
                }
                
                it("Should get valid path") {
                    let path: String = "http://hubhomo.brubank.ad:8080/graphql"
                    expect(pathFromBundle).to(equal(path))
                }
                
                it("Should get valid path") {
                    expect(pathFromBundle).notTo(beEmpty())
                }
            }
        }
    }
}
