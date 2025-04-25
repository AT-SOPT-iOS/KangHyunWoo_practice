//
//  WelcomeViewController_Closure.swift
//  Week2_iOS
//
//  Created by hyunwoo on 4/12/25.
//

import UIKit

class WelcomeViewController_Closure: UIViewController {
    
    var id: String?
    var loginDataCompletion: ((String)-> Void)?
    
    private func bindID() {
        if let id = id {
            self.welcomeLabel.text = "\(id)님 \n반가워요!"
        } else {
            self.welcomeLabel.text = "회원님 \n반가워요!"
        }
    }

    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "dog")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 25)
        return label
        }()
    
    private lazy var backToMainButton : UIButton = {
        let button = UIButton(frame: CGRect(x : 20, y: 426, width : 335, height : 57))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 14/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        return button
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x : 20, y: 498, width : 335, height : 57))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시로그인", for: .normal)
        button.setTitleColor(UIColor(red:172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size:18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
        }()
    
    @objc
    private func backToLoginButtonDidTap(){
        
        guard let loginDataCompletion else{return}
        if let id = id {
            loginDataCompletion(id)
        }
        
        if self.navigationController == nil{
            self.dismiss(animated: true)
        } else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(imageView)
        self.view.addSubview(backToLoginButton)
        self.view.addSubview(backToMainButton)
        self.view.addSubview(welcomeLabel)
        bindID()
    }
}
