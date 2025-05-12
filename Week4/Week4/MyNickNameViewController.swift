//
//  MyNickNameViewController.swift
//  Week4
//
//  Created by hyunwoo on 5/7/25.
//

import UIKit

import SnapKit
import Then


final class MyNickNameViewController: UIViewController {
    
    // MARK: - Properties
    
    private var nickname: String = ""
    private let userId: Int  // 실제 로그인된 사용자 ID
    
    init(userId: Int) {
        self.userId = userId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
    }
    
    // MARK: - Actions
    
    
    @objc private func searchButtonTap() {
        Task {
            do{
                let mynickname = try await UserInfoService.shared.fetchNickName(userId: self.userId)
                
                self.infoLabel.text = "닉네임 : \(mynickname)"
                
            } catch {
                self.infoLabel.text = "조회실패 : \(error.localizedDescription)"
            }
        }
    }
    
    @objc private func renameButtonTap() {
        Task{
            do{
                let response = try await RenameService.shared.PatchRegisterData(userId: self.userId, nickName: self.nickname) //response변수 안써서 경고는 뜹니다
                self.newLabel.text = "새로운 닉네임 : \(nickname)"
            } catch {
                self.newLabel.text = "업데이트 실패 : \(error.localizedDescription)"
            }
        }
    }
    
    @objc private func textFieldDidEditing(_ textField: UITextField) {
        self.nickname = textField.text ?? ""
    }
    
    // MARK: - Layout
    
    private func setLayout() {
        self.view.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(200)
        }
        
        [nickNameTextField,infoLabel,newLabel, searchButton, renameButton].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }
    
    // MARK: - UI Components
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 20
    }
    private lazy var nickNameTextField = UITextField().then{
        $0.backgroundColor = .lightGray
        $0.placeholder = "새로운 닉네임을 입력하세요"
        $0.layer.cornerRadius = 4
        $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
        $0.setLeftPadding(12)
        $0.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .editingChanged)
    }
    
    
    private lazy var searchButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(searchButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .blue
        $0.setTitle("닉네임 조회", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8
        $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    private lazy var renameButton = UIButton().then{
        $0.addTarget(self,
                     action: #selector(renameButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .blue
        $0.setTitle("닉네임 변경하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8
        $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    private lazy var infoLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 16)
    }
    private lazy var newLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 16)
    }
}

// MARK: - Padding Extension

private extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
