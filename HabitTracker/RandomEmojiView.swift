import UIKit
import Foundation

class EmojiView: UIView {
    private let emojiLabel = UILabel()
    private let emojiList = ["💪", "🙄", "🫡", "🤥", "😬", "🥱"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeEmoji)))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        emojiLabel.text = getRandomEmoji()
        emojiLabel.textAlignment = .center
        emojiLabel.font = UIFont.systemFont(ofSize: 50)
        
        addSubview(emojiLabel)
        
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emojiLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    @objc
    private func changeEmoji() {
        emojiLabel.text = getRandomEmoji()
    }
    
    private func getRandomEmoji() -> String {
        let randomIndex = Int.random(in: 0..<emojiList.count)
        return emojiList[randomIndex]
    }
}
