//
//  ViewController.swift
//  iOS_Study_A
//
//  Created by 박지윤 on 2023/09/28.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    var memoList: [String] = []
    
    var memoTableView: UITableView = {
            let tableView = UITableView()
            tableView.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.identifier)

            return tableView
        }()

    override func viewDidLoad() {
            super.viewDidLoad()
            configureSubviews()
            makeConstraints()
            setNavigationBar()
            
            memoTableView.dataSource = self
            memoTableView.delegate = self

            view.backgroundColor = .white
        }
    
    func addNewMemo(memo: String) {
            memoList.append(memo)
            memoTableView.reloadData()
        }
    
    func configureSubviews() {
            view.addSubview(memoTableView)
    }
        
    func makeConstraints() {
            memoTableView.snp.makeConstraints { make in
                    make.edges.equalTo(view.safeAreaLayoutGuide)
            }
    }
    
    func setNavigationBar() {
            let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
            
            navigationItem.title = "메모장"
            navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonTapped() {
            let addMemoViewController = AddMemoViewController()
            self.navigationController?.pushViewController(addMemoViewController, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return memoList.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = memoTableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.identifier, for: indexPath) as? MemoTableViewCell else {
                return UITableViewCell()
            }

            cell.titleLabel.text = memoList[indexPath.row]

            return cell
        }
    }
