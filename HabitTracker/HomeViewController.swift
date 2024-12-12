import UIKit

class HomeViewController: UIViewController, UITableViewDelegate {
    // MARK: - Variables
    private let checkItems: [CheckItemView] = [
        CheckItemView(),
        CheckItemView(),
        CheckItemView(),
        CheckItemView(),
        CheckItemView()
    ]
    
    // MARK: - UI Components
    private let 😀 = EmojiView()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        return tableView
    }()
    private var titleLabel = UILabel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func loadView() {
        super.loadView()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupGradientBackGround()
        setupTitle()
        setupEmojiView()
        setupTableView()
    }
    
    private func setupTitle() {
        titleLabel.frame = view.bounds
        titleLabel.text = "Task Manager"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupGradientBackGround() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.cgColor,  UIColor(red: 85, green: 5, blue: 53, alpha: 1).cgColor]
        gradientLayer.locations = [0.45, 70.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupEmojiView() {
        😀.frame = CGRect(x: 0, y: 30, width: 100, height: 100)
        view.addSubview(😀)
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .singleLine
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
    }
    

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomTableViewCell(itemModel: .init(check: false, text: "texto", points: 10))
        cell.contentView.isUserInteractionEnabled = true
        cell.separatorInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        return cell
    }
}


