//
//  SizeTableViewCell.swift
//  iOS_Study_A
//
//  Created by 박현수 on 2023/10/11.
//

import UIKit

class SizeTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLabelView: UILabel!
    @IBOutlet weak var necessaryLabelView: UILabel!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var largeButton: UIButton!
    
    @IBOutlet weak var mediumLabel: UILabel!
    
    @IBOutlet weak var largeLabel: UILabel!
    
    @IBOutlet weak var mediumPriceLabel: UILabel!
    
    @IBOutlet weak var largePriceLabel: UILabel!
    
    
    @IBAction func mediumSelected(_ sender: Any) {
        mediumButton.isSelected = true
        largeButton.isSelected = false
        print("medium")
    }
    
    @IBAction func largeSelected(_ sender: Any) {
        largeButton.isSelected = true
        mediumButton.isSelected = false
        print("large")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        priceLabelView.text = "가격"
        priceLabelView.font = .boldSystemFont(ofSize: 20)
        necessaryLabelView.text = "필수"
        necessaryLabelView.textColor = .blue
        necessaryLabelView.backgroundColor = .blue.withAlphaComponent(0.1)
        mediumLabel.font = .systemFont(ofSize: 20)
        largeLabel.font = .systemFont(ofSize: 20)
        mediumButton.setImage(UIImage(systemName: "dot.circle"), for: .selected)
        mediumButton.setImage(UIImage(systemName: "circle"), for: .normal)
        largeButton.setImage(UIImage(systemName: "dot.circle"), for: .selected)
        largeButton.setImage(UIImage(systemName: "circle"), for: .normal)
        mediumPriceLabel.font = .systemFont(ofSize: 20)
        largePriceLabel.font = .systemFont(ofSize: 20)
        mediumPriceLabel.text = "20,000원"
        largePriceLabel.text = "25,000원"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
