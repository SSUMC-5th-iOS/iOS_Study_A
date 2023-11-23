//
//  ViewController.swift
//  WeekFour
//
//  Created by 김수민 on 2023/11/09.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
//    private let idTextField: UITextField = UITextField()
//    private let passwordTextField: UITextField = UITextField()
    let footerLabel: UILabel = {
            let label = UILabel()
            label.text = "이것은 푸터입니다."
            return label
        }()
        
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter ID"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        return textField
    }()
    var logInButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .cyan
            button.setTitle("로그인", for: .normal)
            // Add any additional configurations for the button
            button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
            return button
        }()
        
    var registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan
        button.setTitle("회원가입", for: .normal)
        // Add any additional configurations for the button
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var logOutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan
        button.setTitle("로그아웃", for: .normal)
        // Add any additional configurations for the button
        button.addTarget(self, action: #selector(logOutTapped), for: .touchUpInside)
        return button
    }()
    @objc func logOutTapped(){
        UserDefaults.standard.removeObject(forKey: "isAutoLogin")
    }
    @objc func loginButtonTapped(){
        if (loginSuccessChecking()) {
            footerLabel.text = "로그인완료!"
            let alertController = autoLoginAlert()
            present(alertController, animated: true, completion: nil)
        } else {footerLabel.text = "로그인 실패 ㅠㅠ"}
    }
    func autoLoginAlert() -> UIAlertController{
        let alertController = UIAlertController(title: "자동 로그인 활성화",
                                                message: "자동 로그인을 활성화 하시겠습니까?",
                                                preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default, handler: {_ in
            UserDefaults.standard.set("success", forKey:  "isAutoLogin")
            let nextViewController = SecondViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        })
        let noAction = UIAlertAction(title: "아니요", style: .default, handler: { _ in
            UserDefaults.standard.set("fail", forKey:  "isAutoLogin")
            let nextViewController = SecondViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        })
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        return alertController
    }
    func loginSuccessChecking() -> Bool {
        if (UserDefaults.standard.string(forKey: "id") == idTextField.text && UserDefaults.standard.string(forKey: "password") == passwordTextField.text){
            return true
        } else { return false }
    }
    @objc func registerButtonTapped(){
        //        let nextViewController = SecondViewController()
        //                navigationController?.pushViewController(nextViewController, animated: true)
        if let idValue = idTextField.text, let passwordValue = passwordTextField.text{
            UserDefaults.standard.set(idValue, forKey: "id")
            UserDefaults.standard.set(passwordValue, forKey: "password")
            footerLabel.text = "회원가입 완료!"
//            print(UserDefaults.standard.string(forKey: "id"))
        } else {
            footerLabel.text = "값을 입력해주세요."
        }
    }
        
//    var logInButton: UIButton = UIButton()
//    var registerButton: UIButton = UIButton()
    

    lazy var stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [footerLabel,idTextField, passwordTextField, logInButton, registerButton,logOutButton])
            stackView.axis = .vertical
            stackView.alignment = .center
            stackView.distribution = .equalSpacing
            stackView.spacing = 20
            return stackView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userId = UserDefaults.standard.string(forKey:"isAutoLogin"), userId == "success"{
            let nextViewController = SecondViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        // Do any additional setup after loading the view.
        configUI()
//        self.view.addSubview(idTextField)
//        self.view.addSubview(passwordTextField)
//        self.view.addSubview(logInButton)
//        self.view.addSubview(registerButton)
        self.view.addSubview(stackView)
        layout()
        
    }

    func configUI(){
        self.view.backgroundColor = .white
        
    }
    func layout(){
        idTextField.snp.makeConstraints { make in
                  make.height.equalTo(50)
                  make.width.equalTo(200)
              }
              
          passwordTextField.snp.makeConstraints { make in
              make.height.equalTo(50)
              make.width.equalTo(200)
          }
          
          logInButton.snp.makeConstraints { make in
              make.height.equalTo(50)
              make.width.equalTo(200)
          }
          
          registerButton.snp.makeConstraints { make in
              make.height.equalTo(50)
              make.width.equalTo(200)
          }
          
          stackView.snp.makeConstraints { make in
              make.centerX.centerY.equalToSuperview()
          }
      }
}

