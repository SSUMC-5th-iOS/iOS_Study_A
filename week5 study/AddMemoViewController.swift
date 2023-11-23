import UIKit
import SnapKit

class AddMemoViewController: UIViewController {

    private var memoTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "메모를 작성하세요."
        textField.borderStyle = .roundedRect
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "메모 작성"

        setupSubviews()
    }

    private func setupSubviews() {
        view.addSubview(memoTextField)

        memoTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.height.equalTo(40)
        }

        let writeButton = UIBarButtonItem(title: "작성하기", style: .plain, target: self, action: #selector(writeButtonTapped))
        navigationItem.rightBarButtonItem = writeButton
    }

    @objc private func writeButtonTapped() {
        guard let memoText = memoTextField.text, !memoText.isEmpty else {
            // Handle empty memo or do nothing if the text field is empty
            return
        }

        // Pass the memo text back to ViewController
        if let navigationController = navigationController,
           let viewController = navigationController.viewControllers.first(where: { $0 is ViewController }) as? ViewController {
            viewController.addNewMemo(memo: memoText)
            navigationController.popViewController(animated: true)
        }
    }
}

