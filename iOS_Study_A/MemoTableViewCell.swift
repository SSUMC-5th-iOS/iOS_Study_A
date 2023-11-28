//
//  MemoTableViewCell.swift
//  iOS_Study_A
//
//  Created by 신혜림 on 2023/11/28.
//

import UIKit
import SnapKit

class MemoTableViewCell: UITableViewCell {
    static let identifier = "MemoTableViewCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
        makeConstraints()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        contentView.addSubview(titleLabel)
    }
    
    func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).inset(15)
        }
    }
}

