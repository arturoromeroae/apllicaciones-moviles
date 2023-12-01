enum TabbedItems: Int, CaseIterable{
    case home = 0
    case favorite
    case location
    case profile
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorite"
        case .location:
            return "Find"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "home-icon"
        case .favorite:
            return "favorite-icon"
        case .location:
            return "map-icon"
        case .profile:
            return "profile-icon"
        }
    }
}
