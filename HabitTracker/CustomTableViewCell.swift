import UIKit
import Foundation

struct ItemModel {
    let check: Bool
    let text: String
    let points: Int
}

protocol CheckItemViewDelegate: AnyObject {
    func didTapCheckItemView()
}

class CustomTableViewCell: UITableViewCell, CheckItemViewDelegate {
    private let itemModel: ItemModel
    
    private lazy var checkItemView: CheckItemView = {
        let view = CheckItemView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isChecked = itemModel.check
        return view
    }()
    
    private lazy var text: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = itemModel.text
        return label
    }()
    
    private lazy var points: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "•   \(itemModel.points) pts"
        return label
    }()
    
    init(itemModel: ItemModel) {
        self.itemModel = itemModel
        super.init(style: .default, reuseIdentifier: nil)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(checkItemView)
        contentView.addSubview(text)
        contentView.addSubview(points)
        
        checkItemView.delegate = self
        
        NSLayoutConstraint.activate([
            checkItemView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            checkItemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            checkItemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            text.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            text.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            text.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            points.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            points.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            points.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        self.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        self.layer.cornerRadius = 10
    }
    
    func didTapCheckItemView() {
        if checkItemView.isChecked {
            self.backgroundColor = UIColor.green.withAlphaComponent(0.25)
        } else {
            self.backgroundColor = UIColor.red.withAlphaComponent(0.25)
        }
    }
    
}
