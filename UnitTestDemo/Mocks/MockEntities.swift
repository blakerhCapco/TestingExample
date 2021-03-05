//
//  MockEntities.swift
//  UnitTestDemo
//
//  Created by bhrs on 3/4/21.
//

import Foundation

struct MockEntities {
    static let positiveEntity = MockEntity(currency: 100.44, debtStatus: "NONE", name: "Blake")
    static let someDebitEntity = MockEntity(currency: -100.44, debtStatus: "SOME", name: "Blake")
    static let negitiveEntity = MockEntity(currency: -1000.44, debtStatus: "HIGH", name: "Blake")
}
