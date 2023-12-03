import UIKit
class ItemCell2: UICollectionViewCell {
    
    private let img: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "airpods")
        return imgView
    }()
        
    // label 생성
    private let itemName: UILabel = {
        let label = UILabel()
        label.text = "에어팟"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private let itemPrice: UILabel = {
        let label = UILabel()
        label.text = "62,000 원"
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
        contentView.addSubview(itemPrice)

            
        img.translatesAutoresizingMaskIntoConstraints = false
        itemName.translatesAutoresizingMaskIntoConstraints = false
        itemPrice.translatesAutoresizingMaskIntoConstraints = false

            
        NSLayoutConstraint.activate([
            img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            img.widthAnchor.constraint(equalToConstant: 100),
            img.heightAnchor.constraint(equalToConstant: 100),
            
            itemName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            itemName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            itemName.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 10),
            itemName.heightAnchor.constraint(equalToConstant: 20),
            
            itemPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            itemPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            itemPrice.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 5),
            itemPrice.heightAnchor.constraint(equalToConstant: 20),
            
        ])
    }
    
}
