import Foundation

protocol HomePresenting: AnyObject {
    func didButtonPress(item: ItemModel)
    func showError()
}

class HomePresenter: HomePresenting {
    weak var viewController: HomeViewControlling?
    
    init(viewController: HomeViewControlling? = nil) {
        self.viewController = viewController
    }
    
    func didButtonPress(item: ItemModel) {
        viewController?.updateListItems(item: item)
    }
    
    func showError() {
        viewController?.showErrorAlert()
    }
}
