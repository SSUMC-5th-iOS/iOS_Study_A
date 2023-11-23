//
//  MemoTableViewCell.swift
//  MemoClone
//
//  Created by 박현수 on 2023/11/20.
//

import UIKit
import SnapKit

class MemoTableViewCell: UITableViewCell {
    
    static let identifier = "MemoTableViewCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    var contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
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
        contentView.addSubview(contentLabel)
    }
    
    func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentView).inset(15)
        }
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalTo(contentView).inset(15)
        }
    }
}
