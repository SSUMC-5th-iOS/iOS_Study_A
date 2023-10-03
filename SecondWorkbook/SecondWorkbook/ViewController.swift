//
//  ViewController.swift
//  SecondWorkbook
//
//  Created by 김수민 on 2023/09/30.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableViewCellTitle: [String] = ["1", "2", "3", "4", "5", "6", "7"]
    let tableViewCellSubtitle: [String] = ["11", "22", "33", "44", "55", "66", "77"]
    let price: [String] = ["100원", "200원", "300원", "400원", "500원", "600원", "700원"]
    let cellIdentifier: String = "cell"
    let twoCellIdentifier: String = "twoCell"
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 {
            let collectionCell: CustomCollectionViewCell = tableView.dequeueReusableCell(withIdentifier: self.twoCellIdentifier, for: indexPath) as! CustomCollectionViewCell
            return collectionCell
        } else {
            let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CustomCell
            let firstText: String = tableViewCellTitle[indexPath.row]
            let secondText: String = tableViewCellSubtitle[indexPath.row]
            let thirdText: String = price[indexPath.row]
            cell.firstLabel.text = firstText
            cell.secondLabel.text = secondText
            cell.thirdLabel.text = thirdText
            return cell
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//         return UITableView.automaticDimension
//     }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.text = "광명동"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        setRightBarButtons()
    }
    
    private func setRightBarButtons() {
        let writeButton = self.navigationItem.makeSFSymbolButton(self,
                                                                 action: Selector("pushToWrite"),
                                                                 symbolName: "highlighter")
        let scanQRButton = self.navigationItem.makeSFSymbolButton(self,
                                                                  action: Selector("pushToScanQR"),
                                                                  symbolName: "viewfinder")
        let notificationButton = self.navigationItem.makeSFSymbolButton(self,
                                                                        action: Selector("pushToNotification"),
                                                                        symbolName: "bell")
                    
        self.navigationItem.rightBarButtonItems = [notificationButton, scanQRButton, writeButton]
    }
}

extension UINavigationItem {
    func makeSFSymbolButton(_ target: Any?, action: Selector, symbolName: String) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: symbolName), for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.tintColor = .black
        
        let barButtonItem = UIBarButtonItem(customView: button)
        barButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        barButtonItem.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
        barButtonItem.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        return barButtonItem
    }
    
}
