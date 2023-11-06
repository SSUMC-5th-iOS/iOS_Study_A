//
//  SecondViewController.swift
//  iOS_Study_A
//
//  Created by 박현수 on 2023/11/06.
//

import UIKit
import SnapKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class SecondViewController: UIViewController {

    var handle: AuthStateDidChangeListenerHandle?
    
    let loginSuccessedLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인 성공"
        return label
    }()
    
    let logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    @objc func logOutButtonTapped() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let defaults = UserDefaults.standard
            defaults.set(false, forKey: "isAutoLogin")
            dismiss(animated: true, completion: nil)
        }
        catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(loginSuccessedLabel)
        loginSuccessedLabel.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalToSuperview()
        }
        
        self.view.addSubview(logOutButton)
        logOutButton.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.trailing.equalTo(-10)
            make.bottomMargin.equalToSuperview().inset(10)
        }
        logOutButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        logOutButton.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // [START remove_auth_listener]
        Auth.auth().removeStateDidChangeListener(handle!)
        // [END remove_auth_listener]
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
