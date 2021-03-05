//
//  ViewController.swift
//  UnitTestDemo
//
//  Created by bhrs on 3/4/21.
//

import UIKit

class MyAccountViewController: UIViewController {

    //MARK: Properties
    var sampleViewModel: SampleViewModel? {
        didSet {
            updateView()
        }
    }
    
    //MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var accountAmountSegmentedControl: UISegmentedControl!
    @IBOutlet weak var accountStatusIndicatorView: UIView!
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleViewModel = SampleViewModel(entity: MockEntities.positiveEntity)
    }

    func updateView() {
        guard let viewModel = sampleViewModel else { return }
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
    
}
