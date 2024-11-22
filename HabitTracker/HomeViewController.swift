import UIKit

class HomeViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
    }
    
    private let 😀 = EmojiView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientBackGround()
        
        setupEmojiView()
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

}

