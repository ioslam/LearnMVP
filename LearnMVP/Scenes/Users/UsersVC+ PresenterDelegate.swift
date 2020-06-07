//
//  UsersVC+ PresenterDelegate.swift
//  LearnMVP
//
//  Created by Eslam on 6/4/20.
//  Copyright © 2020 Ioslam. All rights reserved.
//

import Foundation
import SwiftSpinner

extension UsersVC: UsersView {
    func showIndicator() {
        SwiftSpinner.show("")
    }
    
    func hideIndicator() {
        SwiftSpinner.hide()
    }
    
    func showSuccess() {
        usersTableView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
    
    func navigateToVC(user: User?) {
        let vc = UserDetailsVC()
        vc.view.backgroundColor = .white
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
