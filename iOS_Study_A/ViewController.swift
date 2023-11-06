//
//  ViewController.swift
//  iOS_Study_A
//
//  Created by 박지윤 on 2023/09/28.
//

import UIKit
import SnapKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ViewController: UIViewController {

    var handle: AuthStateDidChangeListenerHandle?

    
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .blue
        return label
    }()
    
    let idTextView: UITextView = {
       let idText = UITextView()
        idText.text = "ID를 입력하세요"
        idText.backgroundColor = .white
        return idText
    }()
    
    let pwTextView: UITextView = {
       let pwText = UITextView()
        pwText.text = "비밀번호를 입력하세요"
        pwText.backgroundColor = .white
        return pwText
    }()
    
    @objc func signUpButtonTapped() {
        Auth.auth().createUser(withEmail: idTextView.text, password: pwTextView.text) { authResult, error in
            guard let user = authResult?.user, error == nil else {
                print(error!.localizedDescription)
                self.timeLabel.text = "\(error?.localizedDescription ?? "signup failed")"
                return
            }
            print("\(user.email!) created")
            self.timeLabel.text = "\(user.email!) created"
        }
    }
    
    @objc func signInButtonTapped() {
        Auth.auth().signIn(withEmail: idTextView.text, password: pwTextView.text) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let error = error {
                print("\(error.localizedDescription)")
                strongSelf.timeLabel.text = "\(error.localizedDescription)"
            }
            else {
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "isAutoLogin")
                let secondViewController = SecondViewController()
                secondViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                strongSelf.present(secondViewController, animated: true, completion: nil)
                print("\(strongSelf.idTextView.text ?? "nil") login Successed")
            }
        }
    }
    
    @objc func autoLogin() {
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(secondViewController, animated: true, completion: nil)
        print("\(self.idTextView.text ?? "nil") login Successed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        view.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.right.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(100)
        }
        
        view.addSubview(idTextView)
        idTextView.snp.makeConstraints { make in
         make.height.equalTo(50)
         make.bottom.equalToSuperview().inset(180)
         make.left.right.equalToSuperview().inset(50)
        }
        
        self.view.addSubview(signInButton)
        signInButton.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.trailing.equalTo(-50)
            make.top.equalTo(idTextView.snp.top).offset(-60)
        }
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.trailing.equalTo(-160)
            make.top.equalTo(idTextView.snp.top).offset(-60)
        }
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        view.addSubview(pwTextView)
        pwTextView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(50)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = UserDefaults.standard
        if let object = defaults.object(forKey: "isAutoLogin") as? Bool, object{
            autoLogin()
            print("\(self.idTextView.text ?? "nil") login Successed")
            print("자동 로그인 \(object)")
        } else {
                print("자동 로그인 값 없음")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // [START remove_auth_listener]
        Auth.auth().removeStateDidChangeListener(handle!)
        // [END remove_auth_listener]
      }
}


