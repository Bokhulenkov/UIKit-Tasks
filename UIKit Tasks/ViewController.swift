//
//  ViewController.swift
//  UIKit Tasks
//
//  Created by Alexander Bokhulenkov on 26.09.2024.
//

import UIKit

final class ViewController: UIViewController, RootViewDelegate {
    
    private let rootView = RootView()
    

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(rootView)
        
        setConstraints()
        
        rootView.delegate = self
        
//        closure
        rootView.rootViewClosure = { [weak self] in
            self?.view.backgroundColor = UIColor.gray
        }
    }

    func changeBackgroundColorVC(_ color: UIColor?) {
         view.backgroundColor = color
    }
    
//    responder chain
    @objc func changeBackgroundColor() {
        view.backgroundColor = UIColor.cyan
    }
    
    // MARK: - Constraints
    
    private func setConstraints() {
        rootView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rootView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            rootView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
}
