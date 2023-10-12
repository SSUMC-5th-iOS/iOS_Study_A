//
//  SecondViewController.swift
//  iOS_Study_A
//
//  Created by 박현수 on 2023/10/11.
//

import UIKit

class SecondViewController: UIViewController {
    
    var data : String = ""
    
    @IBOutlet weak var receivedDataLabel: UILabel!
    
    
    @IBAction func goPreviousView(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedDataLabel.text = data
    }
    
}
