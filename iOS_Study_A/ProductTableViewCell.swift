//
//  ProductTableViewCell.swift
//  iOS_Study_A
//
//  Created by 김민지 on 2023/10/03.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ProductImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ProductImageView.layer.cornerRadius = 10
        ProductImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
