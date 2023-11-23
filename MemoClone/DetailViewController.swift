//
//  DetailViewController.swift
//  MemoClone
//
//  Created by 박현수 on 2023/11/20.
//

import UIKit
import SnapKit

protocol ModifyMainViewDelegate: AnyObject {
    func modifyArray(title: String, content: String, cellIndex: Int)
}

class DetailViewController: UIViewController, ModifyMemoDelegate {
    
    var modifyMainViewDelegate: ModifyMainViewDelegate?
    
    func memoModified(index: Int, cellTitle: String, cellContent: String) {
        modifyMainViewDelegate?.modifyArray(title: cellTitle, content: cellContent, cellIndex: index)
        isModified = true
    }
    
    var cellIndex: Int = 0
    var isModified: Bool = false
    
    var titleLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 20)
        return title
    }()
    
    var contentLabel: UILabel = {
        let content = UILabel()
        content.font = .systemFont(ofSize: 15)
        return content
    }()
    
    @objc func modifyMemo() {
        let modifyView = ModifyMemoViewController()
        modifyView.modifyMemoDelegate = self
        modifyView.titleText.text = titleLabel.text
        modifyView.contentText.text = contentLabel.text
        modifyView.cellIndex = cellIndex
        _ = self.navigationController?.pushViewController(modifyView, animated: true)
    }
    
    func configureSubViews() {
        view.addSubview(titleLabel)
        view.addSubview(contentLabel)
    }
    
    func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        contentLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let rightButton = UIBarButtonItem(title: "수정하기", style: .plain, target: self, action: #selector(modifyMemo))
        navigationItem.title = "메모 상세"
        navigationItem.rightBarButtonItem = rightButton
        
        configureSubViews()
        makeConstraints()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isModified == true {
            _ = self.navigationController?.popViewController(animated: false)
        }
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
