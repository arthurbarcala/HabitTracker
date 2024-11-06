import UIKit
import Foundation

class EmojiView: UIView {
    private let emojiLabel = UILabel()
    private let emojiList = ["💪", "🙄", "🫡", "🤥", "😬", "🥱"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        let randomIndex = Int.random(in: 0..<emojiList.count)
        emojiLabel.text = emojiList[randomIndex]
        emojiLabel.textAlignment = .center
        emojiLabel.font = UIFont.systemFont(ofSize: 50)
        
        addSubview(emojiLabel)
        emojiLabel.frame = bounds
    }
}
