//
//  MainView.swift
//  UIKit Tasks
//
//  Created by Alexander Bokhulenkov on 27.09.2024.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func changeColor()
}

final class MainView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: MainViewDelegate?
    
    var mainViewClosure: (()->Void)?
    
    // MARK: - UI
    
    private let delegateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Delegate", for: .normal)
        button.backgroundColor = .systemGray
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let responderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Responder Chain", for: .normal)
        button.backgroundColor = .systemGray
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let closureButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Closure", for: .normal)
        button.backgroundColor = .systemGray
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .yellow
        
        [
            delegateButton,
            responderButton,
            closureButton
        ].forEach { addSubview($0) }
        
        delegateButton.addTarget(self, action: #selector(tapDelegateButton), for: .touchUpInside)
        responderButton.addTarget(self, action: #selector(tapResponderChain), for: .touchUpInside)
        closureButton.addTarget(self, action: #selector(tapClosureButton), for: .touchUpInside)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc private func tapDelegateButton() {
        delegate?.changeColor()
    }
    
    @objc private func tapResponderChain(_ sender: UIButton) {
        next?.perform(#selector(RootView.changeBackgroundColor))
    }
    
    @objc private func tapClosureButton() {
       mainViewClosure?()
    }
    
//    MARK: Settings Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            responderButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            responderButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            responderButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            delegateButton.bottomAnchor.constraint(equalTo: responderButton.topAnchor, constant: -10),
            delegateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            delegateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            closureButton.topAnchor.constraint(equalTo: responderButton.bottomAnchor, constant: 10),
            closureButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            closureButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}


// MARK: - Extensions

extension MainView: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view == responderButton) {
            print("touch")
            return true
        }
        return false
    }
}
