//
//  ViewController.swift
//  week7
//
//  Created by 김민지 on 2023/12/03.
//

import UIKit
import SnapKit

import Alamofire
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {
    
    let loginButton: UIButton = {
        let button =  UIButton()
        button.setImage(UIImage(named: "kakaoButton"), for: .normal)
        button.addTarget(self, action: #selector(kakaoLogin), for: .touchUpInside)
        return button
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        configureSubviews()
        makeConstraints()
        
        
    }
    
    func configureSubviews() {
        view.addSubview(loginButton)
        view.addSubview(loginLabel)
    }
    
    func makeConstraints() {
            loginButton.snp.makeConstraints { make in
                    make.center.equalToSuperview()
            }
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func kakaoLogin() {
        // 카카오톡 실행 가능 여부 확인
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    self.loginLabel.text = "로그인 성공"

                    //do something
                    _ = oauthToken
                }
            }
    }


}

