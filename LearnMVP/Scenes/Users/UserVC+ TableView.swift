//
//  UserVC+ TableView.swift
//  LearnMVP
//
//  Created by Eslam on 6/4/20.
//  Copyright © 2020 Ioslam. All rights reserved.
//

import UIKit
extension UsersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPresenter.getUsersCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "usersCell", for: indexPath) as? UsersCell {
            userPresenter.configUserCell(cell: cell, index: indexPath.row)
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
}
extension UsersVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userPresenter.didSelectUser(index: indexPath.row)
    }
}
