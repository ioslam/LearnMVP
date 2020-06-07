//
//  UsersVCPresenter.swift
//  LearnMVP
//
//  Created by Eslam on 6/4/20.
//  Copyright © 2020 Ioslam. All rights reserved.
//

import Foundation
class UsersVCPresenter {
    
    private weak var view: UsersView?
    private var interactor = UsersInterActor()
    private var users: [User]?
    init(view: UsersView) {
        self.view = view
    }
    func viewDidLoad() {
        getUsers()
    }

    private func getUsers() {
        view?.showIndicator()
        interactor.getUsers { error, user in
            //guard let self = self else { return }
                if let users = user {
                    self.users = users
                    self.view?.showSuccess()
                    self.view?.hideIndicator()
                } else {
                self.view?.hideIndicator()
                self.view?.showError(error: error!.localizedDescription)
            }
        }
    }
    func getUsersCount() -> Int? {
        return users?.count
    }
    func configUserCell(cell: UsersCellView, index: Int) {
        let user = users?[index]
        cell.getUserName(name: user?.name ?? "")
        cell.getUserAddress(address: user?.address?.street ?? "")
        cell.getUserEmail(email: user?.email ?? "")
    }
    func didSelectUser(index: Int) {
        let user = users?[index]
        view?.navigateToVC(user: user)
    }

}

protocol UsersView: class {
    func showIndicator()
    func hideIndicator()
    func showError(error: String)
    func showSuccess()
    func navigateToVC(user: User?)

}
protocol UsersCellView {
    func getUserName(name: String?)
    func getUserAddress(address: String)
    func getUserEmail(email: String)
}
