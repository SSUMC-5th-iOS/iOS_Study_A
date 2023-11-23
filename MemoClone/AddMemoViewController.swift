//
//  AddButtonViewController.swift
//  MemoClone
//
//  Created by 박현수 on 2023/11/20.
//

import UIKit
import SnapKit

protocol MemoAddDelegate: AnyObject {
    func didAddMemo(title: String, content: String)
}

class AddMemoViewController: UIViewController, UITextViewDelegate {

    weak var delegate: MemoAddDelegate?
    
    @objc func registerMemo() {
        if (titleText.textColor == .lightGray || contentText.textColor == .gray || titleText.text.isEmpty || contentText.text.isEmpty) {
            print("잘못된 제목 또는 내용입니다.")
            return
        }
        delegate?.didAddMemo(title: titleText.text, content: contentText.text)
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    var titleText: UITextView = {
        let text = UITextView()
        text.layer.cornerRadius = 5
        text.layer.borderWidth = 0.5
        text.text = "제목 입력"
        text.textColor = UIColor.lightGray
        text.tag = 1
        return text
    }()
    
    var contentText: UITextView = {
        let text = UITextView()
        text.layer.cornerRadius = 5
        text.layer.borderWidth = 0.5
        text.text = "내용 입력"
        text.textColor = UIColor.gray
        text.tag = 2
        return text
    }()
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.tag == 1 {
            if textView.textColor == UIColor.lightGray {
                textView.text = nil
                textView.textColor = UIColor.black
            }
        }
        else if textView.tag == 2 {
            if textView.textColor == UIColor.gray {
                textView.text = nil
                textView.textColor = UIColor.black
            }
        }
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
        
        let rightButton = UIBarButtonItem(title: "작성하기", style: .plain, target: self, action: #selector(registerMemo))
        
        titleText.delegate = self
        contentText.delegate = self
        configureSubviews()
        makeConstraints()
        
        view.backgroundColor = .white
        navigationItem.title = "메모 작성"
        navigationItem.rightBarButtonItem = rightButton
        
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
