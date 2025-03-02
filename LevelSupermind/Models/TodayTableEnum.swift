//
//  TodayTableEnum.swift
//  LevelSupermind
//
//  Created by Shivansh Sharma on 02/03/25.
//

enum TodayTable: CaseIterable {
    case getStarted
    case explore
    case recommendation
    case recents
    case learn
    case featured

    var title: String {
        switch self {
        case .getStarted:
            return "Get Started"
        case .explore:
            return "Explore"
        case .recommendation:
            return "Recommended For You"
        case .recents:
            return "Recents"
        case .learn:
            return "Learn"
        case .featured:
            return "Featured"
        }
    }
}
struct TodayTableItem {
    let item: TodayTable
}
