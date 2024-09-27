//
//  MainView.swift
//  UIKit Tasks
//
//  Created by Alexander Bokhulenkov on 27.09.2024.
//

import UIKit

class MainView: UIView {
    
    let selfMainView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        
        self.addSubview(selfMainView)
        
        [
            delegateButton,
            responderButton,
            closureButton
        ].forEach {selfMainView.addSubview($0)}
        
        
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            selfMainView.topAnchor.constraint(equalTo: self.topAnchor),
            selfMainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            selfMainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            selfMainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            responderButton.trailingAnchor.constraint(equalTo: selfMainView.trailingAnchor, constant: -50),
            responderButton.leadingAnchor.constraint(equalTo: selfMainView.leadingAnchor, constant: 50),
            responderButton.centerYAnchor.constraint(equalTo: selfMainView.centerYAnchor),
            
            delegateButton.bottomAnchor.constraint(equalTo: responderButton.topAnchor, constant: -10),
            delegateButton.leadingAnchor.constraint(equalTo: selfMainView.leadingAnchor, constant: 50),
            delegateButton.trailingAnchor.constraint(equalTo: selfMainView.trailingAnchor, constant: -50),
            
            closureButton.topAnchor.constraint(equalTo: responderButton.bottomAnchor, constant: 10),
            closureButton.leadingAnchor.constraint(equalTo: selfMainView.leadingAnchor, constant: 50),
            closureButton.trailingAnchor.constraint(equalTo: selfMainView.trailingAnchor, constant: -50)        ])
    }
}

extension MainView: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view == delegateButton) {
            print("touch")
            return true
        }
        return false
    }
}
