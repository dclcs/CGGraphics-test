//
//  ViewController.swift
//  CGGraphics-test
//
//  Created by cl d on 2023/10/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(arcView)
        self.arcView.frame = CGRect(x: 16, y: 100, width: 300, height: 40)
    }

    
    
    lazy var arcView: CGArcView = {
        let arcView = CGArcView()
        return arcView
    }()
}

