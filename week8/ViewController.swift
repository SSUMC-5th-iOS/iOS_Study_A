//
//  ViewController.swift
//  week8
//
//  Created by 김민지 on 2023/12/03.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    let stateLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디와 비밀번호를 입력하세요"
        return label
    }()
    
    let inputId: UITextField = {
        let field = UITextField()
        field.placeholder = "아이디"
        field.layer.borderWidth = 1
        field.addLeftPadding()
        return field
    }()
    
    let inputPass: UITextField = {
        let field = UITextField()
        field.placeholder = "비밀번호"
        field.layer.borderWidth = 1
        field.addLeftPadding()
        return field
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        return button
    }()
    
    let newAccountButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("회원가입", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(newAccountButtonClicked), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        configureSubviews()
        makeConstraints()

    }
    
    func configureSubviews() {
        view.addSubview(stateLabel)
        view.addSubview(inputId)
        view.addSubview(inputPass)
        view.addSubview(loginButton)
        view.addSubview(newAccountButton)
    }
    
    func makeConstraints() {
        stateLabel.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
        
        inputId.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stateLabel.snp.bottom).offset(100)
            make.height.equalTo(40)
            make.width.equalTo(300)
        }
        
        inputPass.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.top.equalTo(inputId.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(300)
        }
        
        loginButton.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.top.equalTo(inputPass.snp.bottom).offset(100)
            make.height.equalTo(40)
            make.width.equalTo(300)
        }
        
        newAccountButton.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(300)
        }
    }
    
    @objc func loginButtonClicked() {
        var idList = defaults.array(forKey: "idList") as? [String] ?? [String]()
        var passList = defaults.array(forKey: "passList") as? [String] ?? [String]()
        
        let id = inputId.text!
        let pass = inputPass.text!
        
        let idx = idList.firstIndex(of: id)
        
        if id == "" {
            stateLabel.text = "아이디를 입력하세요."
            return;
        }
        
        if pass == "" {
            stateLabel.text = "비밀번호를 입력하세요."
            return;
        }
        
        if idx != nil {
            if pass == passList[idx ?? 0] {
                stateLabel.text = "로그인에 성공했습니다."
            } else {
                stateLabel.text = "비밀번호가 일치하지 않습니다."
            }
        } else {
            stateLabel.text = "일치하는 아이디가 없습니다."
        }

        
    }
    
    @objc func newAccountButtonClicked() {
        var idList = defaults.array(forKey: "idList") as? [String] ?? [String]()
        var passList = defaults.array(forKey: "passList") as? [String] ?? [String]()
        
        let id = inputId.text!
        let pass = inputPass.text!
        
        if id == "" {
            stateLabel.text = "아이디를 입력하세요."
            return;
        }
        
        if pass == "" {
            stateLabel.text = "비밀번호를 입력하세요."
            return;
        }
        
        if idList.contains(id) {
            stateLabel.text = "이미 해당 아이디가 존재합니다."
        } else if pass != "" {
            idList.append(id)
            passList.append(pass)
            defaults.set(idList, forKey: "idList")
            defaults.set(passList, forKey: "passList")
            stateLabel.text = "회원가입 성공!"
        }
        
    }


}

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}

