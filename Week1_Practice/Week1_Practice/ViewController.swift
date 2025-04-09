//
//  ViewController.swift
//  Week1_Practice
//
//  Created by hyunwoo on 4/9/25.
//

import UIKit

class ViewController: UIViewController {

    private var testView: UIView = UIView(frame: .init(origin: .init(x: 100, y: 150),
                                                       size: .init(width: 120, height: 120)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        testView.backgroundColor = .blue
        
        self.view.addSubview(testView)
    }


}

