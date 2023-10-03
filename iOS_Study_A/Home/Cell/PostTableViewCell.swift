//
//  PostTableViewCell.swift
//  iOS_Study_A
//
//  Created by 박현수 on 2023/10/03.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonLikes: UIButton!
    @IBOutlet weak var buttonComment: UIButton!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var labelMetaInfo: UILabel!
    @IBOutlet weak var labelProductName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        /*
        productImageView.layer.cornerRadius = 5
        productImageView.clipsToBounds = true
         */
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
