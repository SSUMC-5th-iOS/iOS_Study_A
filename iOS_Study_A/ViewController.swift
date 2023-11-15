//
//  ViewController.swift
//  iOS_Study_A
//
//  Created by 박지윤 on 2023/09/28.
//

import UIKit
import SnapKit
import Alamofire
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon

class ViewController: UIViewController {
    
    
    let seoulUrl = "https://api.openweathermap.org/data/2.5/weather?appid=46bf119912a3aaa443360e604dfcaf40&units=metric&q=seoul&lang=kr"
    let busanUrl = "https://api.openweathermap.org/data/2.5/weather?appid=46bf119912a3aaa443360e604dfcaf40&units=metric&q=busan&lang=kr"
    let jejuUrl = "https://api.openweathermap.org/data/2.5/weather?appid=46bf119912a3aaa443360e604dfcaf40&units=metric&q=jeju&lang=kr"
    
    let apiKey = "46bf119912a3aaa443360e604dfcaf40"
    
    let seoul: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 10
        return view
    }()
    let seoulLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        return label
    }()
    let seoulTemp: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        return label
    }()
    let seoulDescription: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        return label
    }()
    
    let busan: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 10
        return view
    }()
    let busanLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBlue
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        return label
    }()
    let busanTemp: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        return label
    }()
    let busanDescription: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        return label
    }()
    
    let jeju: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 10
        return view
    }()
    let jejuLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        return label
    }()
    let jejuTemp: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        return label
    }()
    let jejuDescription: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        return label
    }()
    
    let kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "kakao_login_medium_narrow"), for: .normal)
        return button
    }()
    
    @objc func signInButtonTapped() {
        UserApi.shared.loginWithKakaoAccount {(oauthtoken, error) in
             if let error = error {
                 print(error)
             }
             else {
                 print("loginWithKakaoAccount() success.")
                 let secondViewController = SecondViewController()
                 secondViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                 self.present(secondViewController, animated: true, completion: nil)
                 _ = oauthtoken
             }
         }
    }
    
    func configureSubviews() {
        view.addSubview(seoul)
        seoul.addSubview(seoulLabel)
        seoul.addSubview(seoulDescription)
        seoul.addSubview(seoulTemp)
        view.addSubview(busan)
        busan.addSubview(busanLabel)
        busan.addSubview(busanDescription)
        busan.addSubview(busanTemp)
        view.addSubview(jeju)
        jeju.addSubview(jejuLabel)
        jeju.addSubview(jejuDescription)
        jeju.addSubview(jejuTemp)
        view.addSubview(kakaoLoginButton)
        kakaoLoginButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    func makeConstraints() {
        seoul.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
        }
        seoulLabel.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
        }
        seoulDescription.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(seoulLabel.snp.bottom).offset(10)
        }
        seoulTemp.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(seoulDescription.snp.bottom).offset(10)
        }
        
        busan.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(seoul.snp.bottom).offset(30)
        }
        busanLabel.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
        }
        busanDescription.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(busanLabel.snp.bottom).offset(10)
        }
        busanTemp.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(busanDescription.snp.bottom).offset(10)
        }
        
        jeju.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(busan.snp.bottom).offset(30)
        }
        jejuLabel.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
        }
        jejuDescription.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(jejuLabel.snp.bottom).offset(10)
        }
        jejuTemp.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(jejuDescription.snp.bottom).offset(10)
        }
        kakaoLoginButton.snp.makeConstraints { make in
            make.width.equalTo(183)
            make.height.equalTo(45)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureSubviews()
        makeConstraints()
        
        AF.request(seoulUrl,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default)
        .responseJSON { response in
            switch response.result {
            case .success(let data):
                let dictData = data as! [String: Any]
                let name = dictData["name"] as! String
                let mainData = dictData["main"] as! [String: Any]
                let tempData = mainData["temp"] as! NSNumber
                let temp = tempData.floatValue
                let weatherData = dictData["weather"] as! [[String: Any]]
                let innerData = weatherData.first
                let description = innerData?["description"] as! String
                self.seoulLabel.text = "도시 : \(name)"
                self.seoulDescription.text = "기상 : \(description)"
                self.seoulTemp.text = "기온 : \(String(temp))"
            case .failure(let error):
                print("\(error)")
            }
        }
        
        
        
        AF.request(busanUrl,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default)
        .responseJSON { response in
            switch response.result {
            case .success(let data):
                let dictData = data as! [String: Any]
                let name = dictData["name"] as! String
                let mainData = dictData["main"] as! [String: Any]
                let tempData = mainData["temp"] as! NSNumber
                let temp = tempData.floatValue
                let weatherData = dictData["weather"] as! [[String: Any]]
                let innerData = weatherData.first
                let description = innerData?["description"] as! String
                
                self.busanLabel.text = "도시 : \(name)"
                self.busanDescription.text = "기상 : \(description)"
                self.busanTemp.text = "기온 : \(String(temp))"

            case .failure(let error):
                print("\(error)")
            }
        }
        
        AF.request(jejuUrl,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default)
        .responseJSON { response in
            switch response.result {
            case .success(let data):
                let dictData = data as! [String: Any]
                let name = dictData["name"] as! String
                let mainData = dictData["main"] as! [String: Any]
                let tempData = mainData["temp"] as! NSNumber
                let temp = tempData.floatValue
                let weatherData = dictData["weather"] as! [[String: Any]]
                let innerData = weatherData.first
                let description = innerData?["description"] as! String
                self.jejuLabel.text = "도시 : \(name)"
                self.jejuDescription.text = "기상 : \(description)"
                self.jejuTemp.text = "기온 : \(String(temp))"
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}

