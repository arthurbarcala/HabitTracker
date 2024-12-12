import Foundation
import UIKit

final class CheckItemView: UIView {
    var isChecked = true
    weak var delegate: CheckItemViewDelegate?
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = 8.0
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    lazy var checkButton: UIButton = {
        let button = UIButton.systemButton(with: UIImage(), target: self, action: #selector(didTappedChangeState))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .green
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildView() {
        addSubview(backgroundView)
        addSubview(checkButton)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            backgroundView.heightAnchor.constraint(equalToConstant: 26),
            backgroundView.widthAnchor.constraint(equalToConstant: 26),
            
            checkButton.heightAnchor.constraint(equalToConstant: 30),
            checkButton.widthAnchor.constraint(equalToConstant: 30),
            checkButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: 6),
            checkButton.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor, constant: -4)
        ])
        
    }
    
    @objc
    private func didTappedChangeState() {
        if isChecked {
            checkButton.setImage(nil, for: .normal)
            isChecked = false
        } else {
            checkButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
            isChecked = true
        }
        
        delegate?.didTapCheckItemView()
    }
}
