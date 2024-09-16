import Foundation
import UIKit

final class TabBarController: UITabBarController {
    init(viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.setViewControllers(viewControllers, animated: false)
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        if let items = tabBar.items {
            for (index, item) in items.enumerated() {
                switch index {
                case 0:
                    item.image = UIImage(systemName: "house.fill")
                    item.selectedImage = UIImage(systemName: "house.fill")
                case 1:
                    item.image = UIImage(systemName: "pencil")
                    item.selectedImage = UIImage(systemName: "suite.heart")
                default:
                    break
                }
            }
        }
    }
}
