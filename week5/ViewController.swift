//
//  ViewController.swift
//  week5
//
//  Created by 김민지 on 2023/11/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var orderPrice = 0
    var size = ""
    var select1 = false
    
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pizzaImage")
        return imageView
    }()
    
    let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let productName: UILabel = {
        let label = UILabel()
        label.text = "[재주문 1위] 바싹불고기피자"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    let productInfo: UILabel = {
        let label = UILabel()
        label.text = "바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가제빵선명피자의 야심작"
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .gray
        return label
    }()
    
    let priceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "가격"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    let mSizeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let lSizeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let sizeButton1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "toggle_off"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped1), for: .touchUpInside)
        return button
    }()
    
    let sizeButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "toggle_off"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped2), for: .touchUpInside)
        return button
    }()
    
    let mLabel: UILabel = {
        let label = UILabel()
        label.text = "M"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let lLabel: UILabel = {
        let label = UILabel()
        label.text = "L"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let mPrice: UILabel = {
        let label = UILabel()
        label.text = "20,000원"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let lPrice: UILabel = {
        let label = UILabel()
        label.text = "23,000원"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let selectsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let doughLabel: UILabel = {
        let label = UILabel()
        label.text = "도우변경"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let selectExplainLabel: UILabel = {
        let label = UILabel()
        label.text = "최대 1개 선택"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    let select1View: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let selectButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "select_off"), for: .normal)
        button.addTarget(self, action: #selector(selectTapped), for: .touchUpInside)
        return button
    }()
    
    let select1Label: UILabel = {
        let label = UILabel()
        label.text = "크림리치골드 크러스트"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let select1Price: UILabel = {
        let label = UILabel()
        label.text = "+4,500원"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let orderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let leastPriceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let leastPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "배달최소주문금액"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    let leastPrice: UILabel = {
        let label = UILabel()
        label.text = "17,000원"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let orderButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(named: "mainColor")
        button.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)
        return button
    }()
    
    let orderPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "0원 담기"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: "bgColor")
        configureSubviews()
        makeConstraints()
        
    }
    
    func configureSubviews() {
        view.addSubview(productImageView)
        view.addSubview(infoView)
        infoView.addSubview(productName)
        infoView.addSubview(productInfo)
        view.addSubview(priceView)
        priceView.addSubview(priceLabel)
        priceView.addSubview(mSizeView)
        mSizeView.addSubview(sizeButton1)
        mSizeView.addSubview(mLabel)
        mSizeView.addSubview(mPrice)
        priceView.addSubview(lSizeView)
        lSizeView.addSubview(sizeButton2)
        lSizeView.addSubview(lLabel)
        lSizeView.addSubview(lPrice)
        view.addSubview(selectsView)
        selectsView.addSubview(doughLabel)
        selectsView.addSubview(selectExplainLabel)
        selectsView.addSubview(select1View)
        select1View.addSubview(selectButton)
        select1View.addSubview(select1Label)
        select1View.addSubview(select1Price)
        view.addSubview(orderView)
        orderView.addSubview(leastPriceView)
        leastPriceView.addSubview(leastPriceLabel)
        leastPriceView.addSubview(leastPrice)
        orderView.addSubview(orderButton)
        orderButton.addSubview(orderPriceLabel)
    }
    
    func makeConstraints() {
        productImageView.snp.makeConstraints {make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(300)
        }
        
        infoView.snp.makeConstraints {make in
            make.top.equalTo(productImageView.snp.bottom).offset(0)
            make.left.right.equalToSuperview()
            make.height.equalTo(80)
        }
        
        productName.snp.makeConstraints {make in
            make.left.top.right.equalToSuperview().offset(20)
        }
        
        productInfo.snp.makeConstraints {make in
            make.left.right.equalToSuperview().offset(20)
            make.top.equalTo(productName.snp.bottom).offset(10)
        }
        
        priceView.snp.makeConstraints {make in
            make.left.right.equalToSuperview()
            make.top.equalTo(infoView.snp.bottom).offset(15)
            make.height.equalTo(130)
        }
        
        priceLabel.snp.makeConstraints {make in
            make.left.right.top.equalToSuperview().offset(20)
            make.height.equalTo(30)
        }
        
        mSizeView.snp.makeConstraints {make in
            make.left.right.equalToSuperview()
            make.top.equalTo(priceLabel.snp.bottom)
            make.height.equalTo(50)
        }
        
        lSizeView.snp.makeConstraints {make in
            make.left.right.equalToSuperview()
            make.top.equalTo(mSizeView.snp.bottom)
            make.height.equalTo(50)
        }
        
        sizeButton1.snp.makeConstraints {make in
            make.left.equalToSuperview().offset(20)
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
        }
        
        mLabel.snp.makeConstraints {make in
            make.left.equalTo(sizeButton1.snp.right).offset(20)
            make.centerY.equalToSuperview()
        }
        
        mPrice.snp.makeConstraints {make in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
        
        sizeButton2.snp.makeConstraints {make in
            make.left.equalToSuperview().offset(20)
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
        }
        
        lLabel.snp.makeConstraints {make in
            make.left.equalTo(sizeButton2.snp.right).offset(20)
            make.centerY.equalToSuperview()
        }
        
        lPrice.snp.makeConstraints {make in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
        
        selectsView.snp.makeConstraints {make in
            make.left.right.equalToSuperview()
            make.top.equalTo(lSizeView.snp.bottom).offset(15)
        }
        
        doughLabel.snp.makeConstraints {make in
            make.left.right.top.equalToSuperview().offset(20)
        }
        
        selectExplainLabel.snp.makeConstraints {make in
            make.left.right.equalToSuperview().offset(20)
            make.top.equalTo(doughLabel.snp.bottom).offset(5)
        }
        
        select1View.snp.makeConstraints {make in
            make.top.equalTo(selectExplainLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(50)
            make.bottom.equalToSuperview()
        }
        
        selectButton.snp.makeConstraints {make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        select1Label.snp.makeConstraints {make in
            make.left.equalTo(selectButton.snp.right).offset(20)
            make.centerY.equalToSuperview()
        }
        
        select1Price.snp.makeConstraints {make in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
        
        orderView.snp.makeConstraints {make in
            make.left.right.equalToSuperview()
            make.top.equalTo(select1View.snp.bottom).offset(20)
            make.height.equalTo(100)
        }
        
        leastPriceView.snp.makeConstraints {make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        leastPriceLabel.snp.makeConstraints {make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        leastPrice.snp.makeConstraints {make in
            make.top.equalTo(leastPriceLabel.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview()
        }
        
        orderButton.snp.makeConstraints {make in
            make.left.equalTo(leastPriceView.snp.right).offset(20)
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        orderPriceLabel.snp.makeConstraints {make in
            make.center.equalToSuperview()
        }
    }
    
    @objc func buttonTapped1() {
        sizeButton1.isSelected.toggle()
        sizeButton1.setImage(UIImage(named: "toggle_on"), for: .selected)
        
        if (sizeButton2.isSelected) {
            orderPrice = orderPrice - 23000
        }
        
        if (sizeButton1.isSelected == true) {
            sizeButton2.isSelected = false
            orderPrice = orderPrice + 20000
            size = "M"
        } else {
            orderPrice = orderPrice - 20000
            size = ""
        }
        
        orderPriceLabel.text = numberFormatter(number: orderPrice) + "원 담기"
        
    }
    
    @objc func buttonTapped2() {
        sizeButton2.isSelected.toggle()
        sizeButton2.setImage(UIImage(named: "toggle_on"), for: .selected)
        if(sizeButton1.isSelected) {
            orderPrice = orderPrice - 20000
        }
        
        if (sizeButton2.isSelected == true) {
            sizeButton1.isSelected = false
            orderPrice = orderPrice + 23000
            size = "L"
        } else {
            orderPrice = orderPrice - 23000
            size = ""
        }
        
        
        orderPriceLabel.text = numberFormatter(number: orderPrice) + "원 담기"
    }
    
    @objc func selectTapped() {
        selectButton.isSelected.toggle()
        selectButton.setImage(UIImage(named: "select_on"), for: .selected)
        
        if(selectButton.isSelected) {
            orderPrice = orderPrice + 4500
            select1 = true
        } else {
            orderPrice = orderPrice - 4500
            select1 = false
        }
        
        orderPriceLabel.text = numberFormatter(number: orderPrice) + "원 담기"
    }
    
    @objc func orderButtonTapped() {
        print(orderPrice)
        changeViewController()
        
    }
    
    @objc func changeViewController() {
        let svc = SecondViewController(size:size, orderPrice: orderPrice, select1: select1)
        svc.modalPresentationStyle = .fullScreen
        self.present(svc, animated: true, completion: nil)
    }
    
    func numberFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: number))!
    }
    
}

