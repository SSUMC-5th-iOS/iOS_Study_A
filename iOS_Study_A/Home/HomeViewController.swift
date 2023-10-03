//
//  HomeViewController.swift
//  iOS_Study_A
//
//  Created by 박현수 on 2023/10/03.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        let postNib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(postNib, forCellReuseIdentifier: "PostTableViewCell")
        let themeNib = UINib(nibName: "ThemeTableViewCell", bundle: nil)
        tableView.register(themeNib, forCellReuseIdentifier: "ThemeTableViewCell")
    }

}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThemeTableViewCell", for: indexPath) as? ThemeTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? ThemeTableViewCell else {
            return
        }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThemeCollectionViewCell", for: indexPath) as? ThemeCollectionViewCell else {
            print("a")
            return UICollectionViewCell()
        }
        print("b")
        return cell
    }
    /*
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThemeCollectionViewCell", for: indexPath) as? ThemeCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }*/
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
