//
//  MenuDishViewModel.swift
//  FlipDishMenu
//
//  Created by 李祺 on 07/09/2020.
//  Copyright © 2020 FlipDish. All rights reserved.
//

import Foundation

class MenuDishViewModel {
    private var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem]) {
        self.menuItems = menuItems
    }
    
    func getNumberOfCells() -> Int {
        return self.menuItems.count
    }
    
    func getDishCellViewModel(at index: Int) -> MenuItem {
        return self.menuItems[index]
    }
    
    func getOriginPrice(at index: Int) -> Double {
        return self.menuItems[index].price
    }
}

extension MenuDishViewModel {
    func userPressCell (at index: Int) -> [MenuItemOptionSet] {
        self.menuItems[index].menuItemOptionSets
    }
}
