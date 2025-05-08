@testable import HabitTracker

class HomePresenterSpy: HomePresenting {
    enum Messages: Equatable {
        case didButtonPress(item: ItemModel)
        case showError
    }
    
    var messages: [Messages] = []
    
    func didButtonPress(item: HabitTracker.ItemModel) {
        messages.append(.didButtonPress(item: item))
    }
    
    func showError() {
        messages.append(.showError)
    }
}
