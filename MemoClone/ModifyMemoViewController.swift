//
//  ModifyMemoViewController.swift
//  MemoClone
//
//  Created by 박현수 on 2023/11/20.
//

import UIKit
import SnapKit

protocol ModifyMemoDelegate{
    func memoModified(index: Int, cellTitle: String, cellContent: String)
}

class ModifyMemoViewController: UIViewController {
    
    var modifyMemoDelegate: ModifyMemoDelegate?
    
    var cellIndex: Int = 0
    
    var titleText: UITextView = {
        let text = UITextView()
        text.layer.cornerRadius = 5
        text.layer.borderWidth = 0.5
        return text
    }()
    
    var contentText: UITextView = {
        let text = UITextView()
        text.layer.cornerRadius = 5
        text.layer.borderWidth = 0.5
        text.textColor = UIColor.gray
        return text
    }()
    
    @objc func modifyMemo() {
        modifyMemoDelegate?.memoModified(index: cellIndex, cellTitle: titleText.text, cellContent: contentText.text)
        navigationController?.popViewController(animated: true)
    }
    
    func configureSubviews() {
        view.addSubview(titleText)
        view.addSubview(contentText)
    }
        
    func makeConstraints() {
        titleText.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.equalToSuperview().inset(50)
            make.trailing.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
        contentText.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(150)
            make.leading.equalToSuperview().inset(50)
            make.trailing.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*let rightButton = UIBarButtonItem(title: "수정하기", style: .plain, target: self, action: #selector(modifyMemo))
        
        titleText.delegate = self
        contentText.delegate = self*/
        configureSubviews()
        makeConstraints()
        
        let rightButton = UIBarButtonItem(title: "수정하기", style: .plain, target: self, action: #selector(modifyMemo))
        
        view.backgroundColor = .white
        navigationItem.title = "메모 수정"
        navigationItem.rightBarButtonItem = rightButton
        //navigationItem.rightBarButtonItem = rightButton
        // Do any additional setup after loading the view.
    }
}

