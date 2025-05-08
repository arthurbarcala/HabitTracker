import UIKit

protocol HomeViewControlling: AnyObject {
    func updateListItems(item: ItemModel)
    func showErrorAlert()
}

class HomeViewController: UIViewController, UITableViewDelegate {
    // MARK: - Variables
    private let checkItems: [CheckItemView] = [
        CheckItemView(),
        CheckItemView(),
        CheckItemView(),
        CheckItemView(),
        CheckItemView()
    ]
    var interactor: HomeInteracting
    var items: [ItemModel] = []
    
    init(interactor: HomeInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    private var addItemButton = UIButton()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupGradientBackGround()
        setupTitle()
        setupEmojiView()
        setupTableView()
        setupAddButton()
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
    
    private func setupAddButton() {
        addItemButton.setTitle("+", for: .normal)
        addItemButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        addItemButton.backgroundColor = .clear
        addItemButton.layer.borderColor = UIColor.white.cgColor
        addItemButton.layer.borderWidth = 2
        addItemButton.layer.cornerRadius = 35
        addItemButton.addTarget(self, action: #selector(showTaskCreationAlert), for: .touchUpInside)
        self.view.addSubview(addItemButton)
        addItemButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addItemButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addItemButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addItemButton.widthAnchor.constraint(equalToConstant: 70),
            addItemButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomTableViewCell(itemModel: items[indexPath.row])
        cell.contentView.isUserInteractionEnabled = true
        cell.separatorInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        return cell
    }
}

extension HomeViewController: HomeViewControlling {
    func updateListItems(item: ItemModel) {
        items.append(item)
        print(items)
        tableView.reloadData()
    }
    
    func createAlert(with title: String, message: String) -> UIAlertController {
        UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    @objc
    func showTaskCreationAlert() {
        let alert = createAlert(with: "Nova tarefa", message: "Criar nova tarefa")
        let confirm = UIAlertAction(title: "Confirmar", style: .default) {_ in
            self.confirmAction(alert: alert)
        }
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(confirm)
        alert.addTextField {
            $0.placeholder = "Nome da tarefa"
        }
        alert.addTextField {
            $0.placeholder = "Insira a prioridade (pontos)"
            $0.keyboardType = .numberPad
        }
        
        present(alert, animated: true)
    }
    
    func showErrorAlert(){
        let errorAlert = createAlert(with: "Erro", message: "A tarefa não pode ter nome vazio")
        let closeButton = UIAlertAction(title: "Fechar", style: .cancel, handler: nil)
        errorAlert.addAction(closeButton)
        present(errorAlert, animated: true)
    }
    
    func confirmAction(alert: UIAlertController) {
        guard let taskName = alert.textFields?.first?.text else {
            return
        }
        
        guard let taskScore = Int(alert.textFields?.last?.text ?? "")  else {
            return
        }
        
        UserDefaultManager.shared.score += taskScore
        
        let item = ItemModel(check: false, text: taskName, points: UserDefaultManager.shared.score)
        interactor.addItem(item: item)
    }
}


