//
//  RootView.swift
//  UIKit Tasks
//
//  Created by Alexander Bokhulenkov on 27.09.2024.
//

import UIKit

protocol RootViewDelegate: AnyObject {
    func changeBackgroundColorVC(_ color: UIColor?)
}

final class RootView: UIView, MainViewDelegate {
    
    // MARK: - Properties
    
    weak var delegate: RootViewDelegate?
    
    private let delegateColorVC = UIColor.blue
    
    var rootViewClosure: (()->Void)?
    
    
    
    private let mainView: MainView = {
        let view = MainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .green
        self.addSubview(mainView)
        
        mainView.delegate = self
        
//        closure
        mainView.mainViewClosure = { [weak self] in
            self?.rootViewClosure?()
        }
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeColor() {
        delegate?.changeBackgroundColorVC(delegateColorVC)
    }
    
    override var next: UIResponder? {
        return superview
    }
    
    @objc func changeBackgroundColor() {
        next?.next?.perform(#selector(ViewController.changeBackgroundColor))
    }
    
    // MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            mainView.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70)
        ])
    }

}
