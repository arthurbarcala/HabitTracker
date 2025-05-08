import Foundation
import UIKit

enum HomeFactory {
    static func make() -> UIViewController {
        let presenter = HomePresenter()
        let interactor = HomeInteractor(presenter: presenter)
        let viewController = HomeViewController(interactor: interactor)
        presenter.viewController = viewController
        
        return viewController
    }
}
