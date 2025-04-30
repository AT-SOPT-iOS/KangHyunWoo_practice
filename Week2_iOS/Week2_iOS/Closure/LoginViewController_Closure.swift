//
//  LoginViewController_Closure.swift
//  Week2_iOS
//
//  Created by hyunwoo on 4/12/25.
//

import UIKit

class LoginViewController_Closure: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 76, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 16)
        return label
        }()
        
    let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x : 20, y : 276, width : 335, height : 52))
        textField.placeholder = "아이디"
        textField.font = .systemFont(ofSize: 14)
        textField.backgroundColor = UIColor(red:221/255, green:222/255, blue : 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        return textField
        }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x : 20, y : 335, width: 335, height : 52))
        textField.placeholder = "비밀번호"
        textField.font = .systemFont(ofSize : 14)
        textField.backgroundColor = UIColor(red : 221/255,green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        return textField
        }()
    
    var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x : 21, y: 422, width : 332, height : 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 14/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(loginbuttonDidTapped), for: .touchUpInside)
        return button
        }()
    
    private func presentToWelcomeVC(){
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.id = idTextField.text
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC(){
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.id = idTextField.text
        welcomeViewController.loginDataCompletion = {[weak self] data in
            print("closure가 받아온 Id가 뭘까요", data)
            guard let self else {return}
            self.passwordTextField.text = data
        }
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func loginbuttonDidTapped() {
        pushToWelcomeVC()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(titleLabel)
        self.view.addSubview(idTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        
    }
    }

