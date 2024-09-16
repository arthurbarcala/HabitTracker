import UIKit

class HomeViewController: UIViewController {
//    private lazy var gradientView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        return view
//    }()
    
    override func loadView() {
        super.loadView()
//        view = gradientView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.cgColor,  UIColor(red: 85, green: 5, blue: 53, alpha: 1).cgColor]
        gradientLayer.locations = [0.45, 70.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
//        view.addSubview(gradientView)
//        
//        NSLayoutConstraint.activate([
//            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
//            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])
        
    }

    func setupView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.cgColor,  UIColor(red: 85, green: 5, blue: 53, alpha: 1).cgColor]
        gradientLayer.locations = [0.45, 70.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        var emojiLogoList = ["💪", "🙄", "🫡", "🤥", "😬", "🥱"]
        var randomIndex = Int.random(in: 0..<6)
        
//        emojiLogoLabel.text = emojiLogoList[randomIndex]
//        emojiLogoLabel.textAlignment = .center
//        emojiLogoLabel.font = UIFont.systemFont(ofSize: 50)
//        emojiLogoLabel.frame = CGRect(x: 0, y: 60, width: 80, height: 50)
//        
//        statsLabel.text = "🔥 0    💎 0    🫀 0"
//        statsLabel.textAlignment = .center
//        statsLabel.font = UIFont.systemFont(ofSize: 30)
//        statsLabel.frame = CGRect(x: 80, y: 60, width: UIScreen.main.bounds.width - 80, height:50)
//        statsLabel.textColor = .white
//        
//        homeButton.setTitle("⌂", for: .normal)
//        homeButton.setTitleColor(.white, for: .normal)
//        homeButton.backgroundColor = .red
//        homeButton.titleLabel?.textAlignment = .center
//        homeButton.titleLabel?.font = UIFont .systemFont(ofSize: 80)
//        homeButton.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 120, width: 90, height: 90)
//        
//        view.addSubview(emojiLogoLabel)
//        view.addSubview(statsLabel)
//        view.addSubview(homeButton)
    }

}

