//
//  SampleViewModel.swift
//  UnitTestDemo
//
//  Created by bhrs on 3/4/21.
//

import Foundation

struct MyAccountViewModel {
    let name: String
    let amount: String
    let debtStatus: DebtStatus
    
    /*
     Think of an entity as the data you get from the serive
     without any modifications. It's pure.
     */
    init(with entity: MockEntity) {
        name = entity.name
        amount = MyAccountViewModel.USDCurrencyFormatter(entity.currency)
        
        switch entity.debtStatus {
        case DebtStatus.none.rawValue:
            debtStatus = DebtStatus.none
        case DebtStatus.some.rawValue:
            debtStatus = DebtStatus.some
        case DebtStatus.high.rawValue:
            debtStatus = DebtStatus.high
        default:
            debtStatus = DebtStatus.none
        }
    }
    
    private static func USDCurrencyFormatter(_ amount: Double) -> String {
        var result: String
        
        if amount >= 0 {
            result = "$\(amount)"
        } else {
            var amountString = String(amount)
            amountString.removeFirst()
            result = "-$\(amountString)"
        }
        
        return result
    }
    
}

enum DebtStatus: String {
    case none = "NONE"
    case some = "SOME"
    case high = "HIGH"
}
