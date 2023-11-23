//
//  ViewController.swift
//  MemoClone
//
//  Created by 박현수 on 2023/11/20.
//

import UIKit
import SnapKit


class ViewController: UIViewController, MemoAddDelegate, ModifyMainViewDelegate {
    func modifyArray(title: String, content: String, cellIndex: Int) {
        titleArray[cellIndex] = title
        contentArray[cellIndex] = content
        memoTableView.reloadData()
    }
    
    
    func didAddMemo(title: String, content: String) {
        titleArray.append(title)
        contentArray.append(content)
        memoTableView.reloadData()
    }
    

    var titleArray: [String] = []
    var contentArray: [String] = []
    
    var memoTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.identifier)
        return tableView
    }()
    
    @objc func addButtonTapped() {
        let addMemoViewController = AddMemoViewController()
        addMemoViewController.delegate = self
        self.navigationController?.pushViewController(addMemoViewController, animated: true)
    }
    
    func configureSubviews() {
        view.addSubview(memoTableView)
    }
        
    func makeConstraints() {
        memoTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        makeConstraints()
        memoTableView.dataSource = self
        memoTableView.delegate = self
        setNavigationBar()
        
        func setNavigationBar() {
            let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
            
            navigationItem.title = "메모장"
            navigationItem.rightBarButtonItem = addButton
        }
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = memoTableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.identifier, for: indexPath) as? MemoTableViewCell else { return UITableViewCell() }
                
        
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.contentLabel.text = contentArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = DetailViewController()
        detailView.cellIndex = indexPath.row
        detailView.titleLabel.text = titleArray[indexPath.row]
        detailView.contentLabel.text = contentArray[indexPath.row]
        detailView.modifyMainViewDelegate = self
        self.navigationController?.pushViewController(detailView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            titleArray.remove(at: indexPath.row)
            contentArray.remove(at: indexPath.row)
            tableView.endUpdates()
        }
    }
}

