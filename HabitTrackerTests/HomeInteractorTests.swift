import XCTest
@testable import HabitTracker

class HomeInteractorTests: XCTest {
    func test_addItem_whenTextIsNotEmpty_shouldAddItem() {
        let presenterSpy = HomePresenterSpy()
        let sut = HomeInteractor(presenter: presenterSpy)
        let item = ItemModel(check: false, text: "teste", points: 10)
        
        sut.addItem(item: item)
        
        XCTAssertEqual(presenterSpy.messages, [.didButtonPress(item: ItemModel(check: false, text: "teste", points: 10))])
    }
    
    func test_addItem_whenTextIsEmpty_shouldShowError() {
        let presenterSpy = HomePresenterSpy()
        let sut = HomeInteractor(presenter: presenterSpy)
        let item = ItemModel(check: false, text: "", points: 10)
        
        sut.addItem(item: item)
        
        XCTAssertEqual(presenterSpy.messages, [.showError])
    }
}
