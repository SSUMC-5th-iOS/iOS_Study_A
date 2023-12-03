import UIKit
class ItemCell: UITableViewCell {
    
    private let img: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "airpods")
        return imgView
    }()
        
    // label 생성
    private let itemName: UILabel = {
        let label = UILabel()
        label.text = "에어팟 맥스"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private let itemLocation: UILabel = {
        let label = UILabel()
        label.text = "서울특별시 양천구"
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let itemTime: UILabel = {
        let label = UILabel()
        label.text = "3시간 전"
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let itemPrice: UILabel = {
        let label = UILabel()
        label.text = "490,000 원"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let heartIcon: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private func setConstraint() {
        contentView.addSubview(img)
        contentView.addSubview(itemName)
        contentView.addSubview(itemLocation)
        contentView.addSubview(itemTime)
        contentView.addSubview(itemPrice)

            
        img.translatesAutoresizingMaskIntoConstraints = false
        itemName.translatesAutoresizingMaskIntoConstraints = false
        itemLocation.translatesAutoresizingMaskIntoConstraints = false
        itemTime.translatesAutoresizingMaskIntoConstraints = false
        itemPrice.translatesAutoresizingMaskIntoConstraints = false

            
        NSLayoutConstraint.activate([
            img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            img.widthAnchor.constraint(equalToConstant: 100),
            img.heightAnchor.constraint(equalToConstant: 100),
            
            itemName.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 10),
            itemName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 15),
            itemName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            itemName.heightAnchor.constraint(equalToConstant: 20),
            
            itemLocation.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 10),
            itemLocation.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 10),
            itemLocation.heightAnchor.constraint(equalToConstant: 16),
            
            itemTime.leadingAnchor.constraint(equalTo: itemLocation.trailingAnchor, constant: 2),
            itemTime.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 10),
            itemTime.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -15),
            itemTime.heightAnchor.constraint(equalToConstant: 16),
            
            itemPrice.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 10),
            itemPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 15),
            itemPrice.topAnchor.constraint(equalTo: itemLocation.bottomAnchor, constant: 5),
            itemPrice.heightAnchor.constraint(equalToConstant: 20),
            
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
