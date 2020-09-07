//
//  OptionViewModel.swift
//  FlipDishMenu
//
//  Created by 李祺 on 07/09/2020.
//  Copyright © 2020 FlipDish. All rights reserved.
//

import Foundation

class OptionViewModel {
    private var optionItems: [MenuItemOptionSet]
    private var originPrice: Double

    init(optionItems: [MenuItemOptionSet], originPrice: Double) {
        self.optionItems = optionItems
        self.originPrice = originPrice
    }
    
    func getNumberOfSections() -> Int {
        return self.optionItems.count
    }
    
    func getTitleOfSection(at section: Int) -> String {
        return self.optionItems[section].name ?? "option"
    }
    
    func getNumberOfCellsInSection(at section: Int) -> Int {
        return self.optionItems[section].menuItemOptionSetItems.count
    }
    
    func getOptionCellViewModel(at index: IndexPath) -> MenuItemOptionSetItem {
        var option = self.optionItems[index.section]
        
        if !option.isMasterOptionSet {
            for index in 0 ... option.menuItemOptionSetItems.count - 1 {
                option.menuItemOptionSetItems[index].itemPrice = originPrice
            }
        }
        return option.menuItemOptionSetItems[index.row]
    }
}
