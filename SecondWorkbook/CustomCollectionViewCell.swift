//
//  CustomSelectionViewCell.swift
//  SecondWorkbook
//
//  Created by 김수민 on 2023/10/02.
//

import UIKit

class CustomCollectionViewCell: UITableViewCell, UICollectionViewDataSource {
    
    let cellIdentifier: String = "pink"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath)
            return cell
    }
    
    
    @IBOutlet var customCollectionViewCell: UICollectionView!
    @IBOutlet var label: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.customCollectionViewCell.dataSource = self
        label.font = UIFont.boldSystemFont(ofSize: 16)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}

