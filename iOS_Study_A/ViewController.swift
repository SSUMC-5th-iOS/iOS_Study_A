//
//  ViewController.swift
//  iOS_Study_A
//
//  Created by 박지윤 on 2023/09/28.
//

import UIKit

class ViewController: UIViewController {
    
    var data : String = ""
    
    @IBOutlet var orderView: UIView!
    @IBOutlet weak var orderTableView: UITableView!
    
    @IBOutlet weak var minimumCostLabel: UILabel!
    
    @IBOutlet weak var howMuchMinimumCost: UILabel!
    @IBOutlet weak var putShoppingCartButton: UIButton!

    
    @IBAction func toCartView(_ sender: Any) {
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        guard let cell = orderTableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? SizeTableViewCell else { return }
        
        if cell.mediumButton.isSelected {
            data = "20000"
        }
        else {
            data = "25000"
        }
        secondViewController.data = data
        secondViewController.modalTransitionStyle = .coverVertical
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true, completion: nil)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderTableView.allowsSelection = false
        
        orderTableView.dataSource = self
        orderTableView.delegate = self
        
        let infoNib = UINib (nibName: "InfoTableViewCell", bundle: nil)
        orderTableView.register(infoNib,forCellReuseIdentifier:"InfoTableViewCell")
        
        let orderNib = UINib (nibName: "orderTableViewCell", bundle: nil)
        orderTableView.register(orderNib,forCellReuseIdentifier:"orderTableViewCell")
        
        let sizeNib = UINib (nibName: "SizeTableViewCell", bundle: nil)
        orderTableView.register(sizeNib,forCellReuseIdentifier:"SizeTableViewCell")
        orderTableView.separatorStyle = .singleLine
        minimumCostLabel.textColor = .gray
        minimumCostLabel.font = .systemFont(ofSize: 14)
        howMuchMinimumCost.text = "20,000원"
        putShoppingCartButton.layer.cornerRadius = 5
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        }
        else if indexPath.row == 1 {
            return 150
        }
        else {
            return 170
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderTableViewCell", for: indexPath) as? orderTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
        else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as? InfoTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SizeTableViewCell", for: indexPath) as? SizeTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
}
