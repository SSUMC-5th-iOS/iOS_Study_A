//
//  SecondViewController.swift
//  iOS_Study_A
//
//  Created by 박현수 on 2023/11/15.
//

import UIKit
import SnapKit
import Alamofire
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon

class SecondViewController: UIViewController {

    @objc func logOutButtonTapped() {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    let logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logOutButton)
        logOutButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
        logOutButton.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
