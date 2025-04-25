//
//  AutoLayoutViewController.swift
//  Week2_iOS
//
//  Created by hyunwoo on 4/12/25.
//

import UIKit

class AutoLayoutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    private func setLayout(){
        [rect1, rect2, rect3, rect4] .forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([rect1.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     rect1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     rect1.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
                                     rect1.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4)])
        
        NSLayoutConstraint.activate([rect2.topAnchor.constraint(equalTo:self.rect1.bottomAnchor),
                                     rect2.leadingAnchor.constraint(equalTo: self.rect1.trailingAnchor),
                                     rect2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
                                     rect2.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4)])
        
        NSLayoutConstraint.activate([rect3.topAnchor.constraint(equalTo:self.rect2.bottomAnchor),
                                     rect3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     rect3.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
                                     rect3.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4)])
        
        NSLayoutConstraint.activate([rect4.topAnchor.constraint(equalTo:self.rect3.bottomAnchor),
                                     rect4.leadingAnchor.constraint(equalTo: self.rect3.trailingAnchor),
                                     rect4.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
                                     rect4.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4)])
        
    }
    
    var rect1: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 0,height: 0)))
        view.backgroundColor = .yellow
        return view
    }()
    
    var rect2: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 20,height: 20)))
        view.backgroundColor = .green
        return view
    }()
    
    var rect3: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 0,height: 0)))
        view.backgroundColor = .black
        return view
    }()
    
    var rect4: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 20,height: 20)))
        view.backgroundColor = .blue
        return view
    }()
    
    
}
