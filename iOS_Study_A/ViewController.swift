
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    private var tableView :UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private var horizontalView :UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let contentView: UIView = {
            let view = UIView()
            return view
    }()
    
    private var bottomView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var image1: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "home")
        return imgView
    }()
    
    private var image2: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "city")
        return imgView
    }()
    
    private var image3: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "location")
        return imgView
    }()
    
    private var image4: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "chat")
        return imgView
    }()
    
    private var image5: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "my")
        return imgView
    }()
    
    private var upperView :UIView = {
        let view = UIView()
        return view
    }()
    
    private var locationLabel : UILabel = {
        let label = UILabel()
        label.text = "광명동"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private var button1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "3line"), for: .normal)
        return button
    }()
    
    private var button2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "search"), for: .normal)
        return button
    }()
    
    private var button3: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "bell"), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        
        setConstraint()
            
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension

    }
    
    private func setConstraint() {
        
        self.view.addSubview(upperView)
        upperView.addSubview(locationLabel)
        upperView.addSubview(button1)
        upperView.addSubview(button2)
        upperView.addSubview(button3)
        self.view.addSubview(tableView)
        self.view.addSubview(bottomView)
        bottomView.addSubview(image1)
        bottomView.addSubview(image2)
        bottomView.addSubview(image3)
        bottomView.addSubview(image4)
        bottomView.addSubview(image5)
        
        //self.view.addSubview(horizontalView)
        
        //horizontalView.addSubview(contentView)

        upperView.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        image1.translatesAutoresizingMaskIntoConstraints = false
        image2.translatesAutoresizingMaskIntoConstraints = false
        image3.translatesAutoresizingMaskIntoConstraints = false
        image4.translatesAutoresizingMaskIntoConstraints = false
        image5.translatesAutoresizingMaskIntoConstraints = false
        
        horizontalView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

            
        NSLayoutConstraint.activate([
            
            upperView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            upperView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            upperView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            upperView.heightAnchor.constraint(equalToConstant: 50),
            
            locationLabel.centerYAnchor.constraint(equalTo: upperView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: upperView.leadingAnchor, constant: 20),
            locationLabel.heightAnchor.constraint(equalToConstant: 28),
            
            button3.heightAnchor.constraint(equalToConstant: 20),
            button3.widthAnchor.constraint(equalToConstant: 20),
            button3.trailingAnchor.constraint(equalTo: upperView.trailingAnchor, constant: -20),
            button3.centerYAnchor.constraint(equalTo: upperView.centerYAnchor),
            
            button2.heightAnchor.constraint(equalToConstant: 20),
            button2.widthAnchor.constraint(equalToConstant: 20),
            button2.trailingAnchor.constraint(equalTo: button3.leadingAnchor, constant: -20),
            button2.centerYAnchor.constraint(equalTo: upperView.centerYAnchor),
            
            button1.heightAnchor.constraint(equalToConstant: 20),
            button1.widthAnchor.constraint(equalToConstant: 20),
            button1.trailingAnchor.constraint(equalTo: button2.leadingAnchor, constant: -20),
            button1.centerYAnchor.constraint(equalTo: upperView.centerYAnchor),
            
            
           tableView.topAnchor.constraint(equalTo: upperView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
           tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            bottomView.heightAnchor.constraint(equalToConstant: 60),
            bottomView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            
            image1.heightAnchor.constraint(equalToConstant: 25),
            image1.widthAnchor.constraint(equalToConstant: 25),
            image1.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            image1.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            
            image2.heightAnchor.constraint(equalToConstant: 25),
            image2.widthAnchor.constraint(equalToConstant: 25),
            image2.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            image2.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 100),
            
            image3.heightAnchor.constraint(equalToConstant: 25),
            image3.widthAnchor.constraint(equalToConstant: 25),
            image3.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            image3.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            
            image4.heightAnchor.constraint(equalToConstant: 25),
            image4.widthAnchor.constraint(equalToConstant: 25),
            image4.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            image4.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -100),
            
            image5.heightAnchor.constraint(equalToConstant: 25),
            image5.widthAnchor.constraint(equalToConstant: 25),
            image5.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            image5.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20),
            
//            horizontalView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            horizontalView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//
//            contentView.leadingAnchor.constraint(equalTo: horizontalView.leadingAnchor),
//            contentView.trailingAnchor.constraint(equalTo: horizontalView.trailingAnchor),
//            contentView.bottomAnchor.constraint(equalTo: horizontalView.bottomAnchor),
//            contentView.heightAnchor.constraint(equalTo: horizontalView.heightAnchor),

                    ])
    }

}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell else { return UITableViewCell() }
        
        return cell
    }
}
