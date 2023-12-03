//
//  secondViewcontroller.swift
//  week5
//
//  Created by 김민지 on 2023/11/16.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    var orderPrice = 0
    var select1 = false
    var size = ""
    
    init(size: String, orderPrice: Int, select1: Bool) {
        super.init(nibName: nil, bundle: nil)
        self.orderPrice = orderPrice
        self.size = size
        self.select1 = select1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let priceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let sizeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let select1Label: UILabel = {
        let label = UILabel()
        label.text = "크림리치골드 크러스트 추가"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: "bgColor")
        sizeLabel.text = size
        priceLabel.text = String(orderPrice)
        configureSubviews()
        makeConstraints()
        
    }
    
    func configureSubviews() {
        view.addSubview(sizeLabel)
        view.addSubview(priceLabel)
        if(select1) {
            view.addSubview(select1Label)
        }
    }
    
    func makeConstraints() {
        sizeLabel.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(300)
        }
        
        priceLabel.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(400)
        }
        
        if(select1) {
            select1Label.snp.makeConstraints {make in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(500)
            }
        }
        
    }

}
