//
//  RootView.swift
//  UIKit Tasks
//
//  Created by Alexander Bokhulenkov on 27.09.2024.
//

import UIKit

class RootView: UIView {
    
    private let mainView: MainView = {
        let view = MainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rootView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(rootView)
        rootView.addSubview(mainView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.addSubview(rootView)
        rootView.addSubview(mainView)
        setConstraints()
        
    }
    
    // MARK: - Set Delegate
    
    func setDelegate(_ delegate: MainViewDelegat) {
        mainView.delegate = delegate
    }
    
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            rootView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            rootView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            rootView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            rootView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            mainView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 30),
            mainView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -30),
            mainView.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 60),
            mainView.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -60)
        ])
    }

}
