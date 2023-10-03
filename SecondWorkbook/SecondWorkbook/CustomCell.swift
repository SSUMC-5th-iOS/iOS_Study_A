//
//  CustomCell.swift
//  SecondWorkbook
//
//  Created by 김수민 on 2023/09/30.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet var leftImageView: UIImageView!
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
