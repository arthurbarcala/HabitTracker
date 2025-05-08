import Foundation

protocol HomeInteracting: AnyObject {
    func addItem(item: ItemModel)
}

class HomeInteractor: HomeInteracting {
    let presenter: HomePresenting
    
    init(presenter: HomePresenting) {
        self.presenter = presenter
    }
    
    func addItem(item: ItemModel) {
        if item.text.isEmpty {
            presenter.showError()
        } else {
            presenter.didButtonPress(item: item)
        }
    }
}
