import SwiftUI

struct TabBarBadgePreferenceKey: PreferenceKey {
    static var defaultValue: [Int?] {
        return .init()
    }
    
    static func reduce(value: inout [Int?], nextValue: () -> [Int?]) {
        value.append(contentsOf: nextValue())
    }
}
