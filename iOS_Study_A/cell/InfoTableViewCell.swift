//
//  InfoTableViewCell.swift
//  iOS_Study_A
//
//  Created by 박현수 on 2023/10/11.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var hotImageView: UIImageView!
    @IBOutlet weak var titleLabelView: UILabel!
    @IBOutlet weak var contentsLabelView: UILabel!
    @IBOutlet weak var nutritionLabelView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabelView.font = .boldSystemFont(ofSize: 20)
        contentsLabelView.textColor = .gray
        contentsLabelView.font = .systemFont(ofSize: 16)
        contentsLabelView.numberOfLines = 0
        contentsLabelView.lineBreakMode = .byCharWrapping
        nutritionLabelView.font = .systemFont(ofSize: 14)
        nutritionLabelView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        nutritionLabelView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
