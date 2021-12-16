//
//  ExchangeListTableViewCell.swift
//  YahooFinance
//
//  Created by Sheikh Ali on 13/12/2021.
//

import UIKit

class ExchangeListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(viewModel: ExchangeListTableViewCellViewModel) {
        titleLabel.text = viewModel.exchangeName
        subtitleLabel.text = viewModel.region
    }
}
