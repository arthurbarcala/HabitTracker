import Foundation

class UserDefaultManager {
    private init() {
        
    }
    
    static let shared = UserDefaultManager()
    var score: Int {
        get{
            UserDefaults.standard.integer(forKey: "score")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "score")
        }
    }
    
    func cleanAll() {
        UserDefaults.standard.removeObject(forKey: "score")
    }
}
