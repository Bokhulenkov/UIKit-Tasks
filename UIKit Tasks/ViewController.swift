//
//  ViewController.swift
//  UIKit Tasks
//
//  Created by Alexander Bokhulenkov on 26.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let rootView = RootView()
    

    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        rootView.setDelegate(self)
    }

    
}

extension ViewController: MainViewDelegat {
    func changeBackgroundColor() {
        view.backgroundColor = .systemBlue
    }
    
    
}

/*
 То есть нажатие на кнопку с Delegate должно сменить белый бэкграунд ViewController на синим, на кнопку Responder Chain сменим цвет бэкграунда ViewController на циан (голубой), на кнопку Closure сменим цвет бэкграунда ViewController на серый.
 */
