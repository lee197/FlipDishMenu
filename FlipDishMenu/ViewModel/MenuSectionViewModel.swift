//
//  MenuViewModel.swift
//  FlipDishMenu
//
//  Created by 李祺 on 07/09/2020.
//  Copyright © 2020 FlipDish. All rights reserved.
//

//
//  MenuListViewModel.swift
//  MenusApp
//
//  Created by 李祺 on 03/09/2020.
//  Copyright © 2020 Drop. All rights reserved.
//

import Foundation

enum UserAlertError:  String, Error {
    case userError = "Please make sure your network is working fine or re-launch the app"
    case serverError = "Please wait a while and re-launch the app"
    case interestsConflict = "We can't make the menu to satisfy all the customers"
}

class MenuSectionViewModel {
    private let apiClient: MenuInfoFetchable
    var showAlertClosure: (()->())?
    var alertMessage: String? {
        didSet {
            showAlertClosure?()
        }
    }
    private var cellViewModels: [MenuSection] = [] {
        didSet {
            reloadTableViewClosure?()
        }
    }
    var reloadTableViewClosure: (()->())?
    private var menuTypes = [String]()
    
    init(apiClient:MenuInfoFetchable = MenuInfoFetcher()) {
        self.apiClient = apiClient
    }
    
    func initFetch() {
        apiClient.fetchMenuInfo { [weak self] result in
            guard let self = self else { return }
            do {
                let menu = try result.get()
                self.cellViewModels = menu.menuSections
                print(menu.menuSections)
            } catch {
                self.alertMessage = UserAlertError.serverError.rawValue
            }
        }
    }
    
    func getNumberOfCells() -> Int {
        return cellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> MenuSection {
        return cellViewModels[indexPath.row]
    }
}

extension MenuSectionViewModel {
    func userPressedCell(at index: IndexPath) -> [MenuItem] {
        let dish = self.cellViewModels[index.row].menuItems
        return dish
    }
}
