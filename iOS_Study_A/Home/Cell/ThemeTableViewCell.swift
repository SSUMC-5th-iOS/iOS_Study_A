//
//  ThemeTableViewCell.swift
//  iOS_Study_A
//
//  Created by 박현수 on 2023/10/03.
//

import UIKit

class ThemeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row : Int) {
        collectionView.dataSource = dataSourceDelegate
        collectionView.delegate = dataSourceDelegate
        collectionView.tag = row
        
        let themeNib = UINib(nibName: "ThemeCollectionViewCell", bundle: nil)
        collectionView.register(themeNib, forCellWithReuseIdentifier: "ThemeCollectionViewCell")
/*
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumLineSpacing = 12
        
        collectionView.collectionViewLayout = flowLayout
        */
        collectionView.reloadData()

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
