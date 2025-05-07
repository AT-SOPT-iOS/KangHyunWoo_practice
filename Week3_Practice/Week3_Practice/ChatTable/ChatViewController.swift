//
//  ChatViewController.swift
//  Week3_Practice
//
//  Created by hyunwoo on 4/26/25.
//

import UIKit

import SnapKit


final class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 72
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                                withIdentifier: ChatTableViewCell.identifier,
                                for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        cell.dataBind(chatList[indexPath.row])
              return cell
    }
    
    private let chatList = ChatModel.dummy()
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func register() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        register()
        setDelegate()
        setLayout()
    }
    private func setLayout(){
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints{$0.edges.equalToSuperview() }
    }
}
