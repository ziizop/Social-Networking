import UIKit

class ButtonView: UIView {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .white
        return button
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title: String, target: Any, selector: Selector) {
        self.init(frame: .zero)
        configure(title: title, target: target, selector: selector)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.size.height / 2
        clipsToBounds = true
    }
    
    private func configure(title: String, target: Any, selector: Selector) {
        
        backgroundColor = .systemPink
        
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.systemPink.cgColor
                
        button.addTarget(target, action: selector, for: .touchUpInside)
        
        addSubview(button)
        
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        button.setTitle(title, for: .normal)

    }
    
}
