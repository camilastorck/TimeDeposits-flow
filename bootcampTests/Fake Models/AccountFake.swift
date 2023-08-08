//
//  AccountFake.swift
//  bootcampTests
//
//  Created by Camila Storck on 29/12/2022.
//

@testable import bootcamp

struct AccountFake {
    
    let accounts: [Account] = [
        Account(balance: 102051582,
                currency: "ARS",
                id: "2322",
                timeDeposits: [TimeDeposit(active: false, dueDate: "2021-07-08", id: "2534", interestRate: 0.36, originalAmount: 1000000, returnAmount: 1360000, startDate: "2020-07-08"),
                               TimeDeposit(active: false, dueDate: "2021-09-10", id: "3191", interestRate: 0.36, originalAmount: 100000, returnAmount: 135901, startDate: "2020-09-11"),
                               TimeDeposit(active: false, dueDate: "2021-03-01", id: "3413", interestRate: 0.36, originalAmount: 1000000, returnAmount: 1072986, startDate: "2020-12-17"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63282", interestRate: 0.4, originalAmount: 50000, returnAmount: 51699, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63283", interestRate: 0.4, originalAmount: 50000, returnAmount: 51699, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63284", interestRate: 0.4, originalAmount: 50000, returnAmount: 51699, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63285", interestRate: 0.4, originalAmount: 50000, returnAmount: 51699, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63286", interestRate: 0.4, originalAmount: 50000, returnAmount: 51699, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63287", interestRate: 0.4, originalAmount: 50000, returnAmount: 51699, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63288", interestRate: 0.4, originalAmount: 58000, returnAmount: 59970, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63333", interestRate: 0.4, originalAmount: 50000, returnAmount: 51699, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63334", interestRate: 0.4, originalAmount: 50000, returnAmount: 51699, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63335", interestRate: 0.4, originalAmount: 50000, returnAmount: 51699, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63336", interestRate: 0.4, originalAmount: 500000, returnAmount: 516986, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63337", interestRate: 0.4, originalAmount: 255500, returnAmount: 264180, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63338", interestRate: 0.4, originalAmount: 255500, returnAmount: 264180, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63339", interestRate: 0.4, originalAmount: 255500, returnAmount: 264180, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63340", interestRate: 0.4, originalAmount: 255500, returnAmount: 264180, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63341", interestRate: 0.4, originalAmount: 55500, returnAmount: 57385, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63342", interestRate: 0.4, originalAmount: 555500, returnAmount: 574372, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63343", interestRate: 0.4, originalAmount: 222500, returnAmount: 230059, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63344", interestRate: 0.4, originalAmount: 888800, returnAmount: 918995, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63345", interestRate: 0.4, originalAmount: 55500, returnAmount: 57385, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63346", interestRate: 0.4, originalAmount: 255500, returnAmount: 264180, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63347", interestRate: 0.4, originalAmount: 255500, returnAmount: 264180, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63348", interestRate: 0.4, originalAmount: 55500, returnAmount: 57385, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63350", interestRate: 0.4, originalAmount: 888500, returnAmount: 918685, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63352", interestRate: 0.4, originalAmount: 55500, returnAmount: 57385, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63353", interestRate: 0.4, originalAmount: 555500, returnAmount: 574372, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63354", interestRate: 0.4, originalAmount: 555500, returnAmount: 574372, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63355", interestRate: 0.4, originalAmount: 55500, returnAmount: 57385, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63356", interestRate: 0.4, originalAmount: 88800, returnAmount: 91817, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63357", interestRate: 0.4, originalAmount: 55500, returnAmount: 57385, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63358", interestRate: 0.4, originalAmount: 55500, returnAmount: 57385, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-16", id: "63400", interestRate: 0.4, originalAmount: 55500, returnAmount: 57385, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-05-15", id: "63401", interestRate: 0.36, originalAmount: 766500, returnAmount: 879900, startDate: "2022-12-16"),
                               TimeDeposit(active: true, dueDate: "2023-01-18", id: "63402", interestRate: 0.41, originalAmount: 3560000, returnAmount: 3679967, startDate: "2022-12-19"),
                               TimeDeposit(active: false, dueDate: "2021-07-08", id: "2538", interestRate: 0.15, originalAmount: 100000, returnAmount: 288, startDate: "2020-07-08"),
                               TimeDeposit(active: false, dueDate: "2021-07-08", id: "2539", interestRate: 0.15, originalAmount: 100000, returnAmount: 288, startDate: "2020-07-08"),
                               TimeDeposit(active: false, dueDate: "2021-03-10", id: "3193", interestRate: 0.15, originalAmount: 250000, returnAmount: 356, startDate: "2020-09-11")]),
        Account(balance: 384715,
                currency: "USD",
                id: "2323",
                timeDeposits: [TimeDeposit(active: false, dueDate: "2020-08-07", id: "2537", interestRate: 0.001, originalAmount: 50000, returnAmount: 50004, startDate: "2020-07-08"),
                               TimeDeposit(active: false, dueDate: "2020-10-05", id: "3158", interestRate: 0.001, originalAmount: 50000, returnAmount: 50004, startDate: "2020-09-04"),
                               TimeDeposit(active: false, dueDate: "2021-09-10", id: "3192", interestRate: 0.001, originalAmount: 500000, returnAmount: 500499, startDate: "2020-09-11"),
                               TimeDeposit(active: false, dueDate: "2021-08-22", id: "15268", interestRate: 0.001, originalAmount: 10000, returnAmount: 10001, startDate: "2021-07-23")])
    ]
}
