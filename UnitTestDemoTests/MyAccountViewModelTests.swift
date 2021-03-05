//
//  MyAccountViewModelTests.swift
//  UnitTestDemoTests
//
//  Created by bhrs on 3/5/21.
//

/*
 Test are written with the Quick and Nimble Framework
 https://github.com/Quick/Nimble
 */

import Quick
import Nimble
@testable import UnitTestDemo

class MyAccountViewModelTests: QuickSpec {
    override func spec() {
      describe("My Account View Model") {
        
        context("account balance - positive") {
            let viewModel = MyAccountViewModel(
                with: MockEntities.positiveEntity
            )
          it("should contain the following properties") {
            expect(viewModel.name).to(equal("Blake"))
            expect(viewModel.amount).to(equal("$100.44"))
            expect(viewModel.debtStatus).to(equal(DebtStatus.none))
          }
        }
        
        context("account balance - slightly negitive") {
            let viewModel = MyAccountViewModel(
                with: MockEntities.someDebitEntity
            )
          it("should contain the following properties") {
            expect(viewModel.name).to(equal("Blake"))
            expect(viewModel.amount).to(equal("-$100.44"))
            expect(viewModel.debtStatus).to(equal(DebtStatus.some))
          }
        }
        
        context("account balance - very negitive") {
            let viewModel = MyAccountViewModel(
                with: MockEntities.negitiveEntity
            )
          it("should contain the following properties") {
            expect(viewModel.name).to(equal("Blake"))
            expect(viewModel.amount).to(equal("-$1000.44"))
            expect(viewModel.debtStatus).to(equal(DebtStatus.high))
          }
        }
        
      }
    }
}
