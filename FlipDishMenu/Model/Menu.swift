import Foundation

// MARK: - Menu
struct Menu: Codable {
    let menuSections: [MenuSection]

    enum CodingKeys: String, CodingKey {
        case menuSections = "MenuSections"
    }
}

// MARK: - MenuSection
struct MenuSection: Codable {
    let name: String
    let menuItems: [MenuItem]
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case menuItems = "MenuItems"
        case imageURL = "ImageUrl"
    }
}

// MARK: - MenuItem
struct MenuItem: Codable {
    let name: String
    let menuItemDescription: String?
    let price: Double
    let menuItemOptionSets: [MenuItemOptionSet]
    let imageURL: String?
  

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case menuItemDescription = "Description"
        case price = "Price"
        case menuItemOptionSets = "MenuItemOptionSets"
        case imageURL = "ImageUrl"
    }
}

// MARK: - MenuItemOptionSet
struct MenuItemOptionSet: Codable {
    let name: String?
    let isMasterOptionSet: Bool
    var menuItemOptionSetItems: [MenuItemOptionSetItem]

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case isMasterOptionSet = "IsMasterOptionSet"
        case menuItemOptionSetItems = "MenuItemOptionSetItems"
    }
}

// MARK: - MenuItemOptionSetItem
struct MenuItemOptionSetItem: Codable {
    let name: String
    var itemPrice: Double

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case itemPrice = "Price"
    }
}
