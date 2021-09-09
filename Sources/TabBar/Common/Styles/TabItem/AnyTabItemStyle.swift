//
//  File.swift
//  
//
//  Created by Tamerlan Satualdypov on 08.09.2021.
//

import SwiftUI

public struct AnyTabItemStyle: TabItemStyle {
    
    private let _makeTabItem: (String, String, Bool) -> AnyView
    
    public init<TabItem: TabItemStyle>(itemStyle: TabItem) {
        self._makeTabItem = itemStyle.tabItemErased(icon:title:isSelected:)
    }
    
    public func tabItem(icon: String, title: String, isSelected: Bool) -> some View {
        return self._makeTabItem(icon, title, isSelected)
    }
}
