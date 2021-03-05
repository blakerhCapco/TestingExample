//
//  ViewController.swift
//  UnitTestDemo
//
//  Created by bhrs on 3/4/21.
//

import UIKit

class MyAccountViewController: UIViewController {

    //MARK: - Properties
    var myAccountViewModel: MyAccountViewModel? {
        didSet { updateView() }
    }
    
    private struct MyAccountSegmentIndex {
        static let positive = 0
        static let neutral = 1
        static let negitive = 2
    }
    
    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var accountStatusIndicatorView: UIView!
    @IBOutlet weak var myAccountSegmentedControl: UISegmentedControl!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        myAccountViewModel = MyAccountViewModel(with: MockEntities.positiveEntity)
    }

    //MARK: - Methods
    func updateView() {
        guard let viewModel = myAccountViewModel else { return }
        nameLabel.text = viewModel.name
        currencyLabel.text = viewModel.amount
        
        switch viewModel.debtStatus {
        case DebtStatus.none:
            accountStatusIndicatorView.backgroundColor = Colors.green
        case DebtStatus.some:
            accountStatusIndicatorView.backgroundColor = Colors.yellow
        case DebtStatus.high:
            accountStatusIndicatorView.backgroundColor = Colors.red
        }
    }
    
    //MARK: - Actions
    @IBAction func updateUIStateSegmentedControl(_ sender: Any) {
        switch myAccountSegmentedControl.selectedSegmentIndex {
        case MyAccountSegmentIndex.positive:
            myAccountViewModel = MyAccountViewModel(
                with: MockEntities.positiveEntity
            )
        case MyAccountSegmentIndex.neutral:
            myAccountViewModel = MyAccountViewModel(
                with: MockEntities.someDebitEntity
            )
        case MyAccountSegmentIndex.negitive:
            myAccountViewModel = MyAccountViewModel(
                with: MockEntities.negitiveEntity
            )
        default:
            break
        }
    }

}
