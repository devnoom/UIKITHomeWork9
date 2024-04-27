

import UIKit

class loginpage: UIView {
    
    let mStack = MainVStack()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        
        addSubview(mStack)
       
       
        constraintsUI()
    }
    
    private func constraintsUI() {
        
        mStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            mStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
    }
}

#Preview {
    loginpage()
}
