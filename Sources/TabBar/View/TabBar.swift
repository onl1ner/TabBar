//
//  MIT License
//
//  Copyright (c) 2021 Tamerlan Satualdypov
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import SwiftUI

public struct TabBar<TabItem: Tabbable>: View {
    
    @Binding private var selection: TabItem
    
    private let tabItemStyle : AnyTabItemStyle
    private let tabBarStyle  : AnyTabBarStyle
    
    private init<ItemStyle: TabItemStyle, BarStyle: TabBarStyle>(
        tabItemStyle : ItemStyle,
        tabBarStyle  : BarStyle,
        selection    : Binding<TabItem>
    ) {
        self.tabItemStyle = .init(itemStyle: tabItemStyle)
        self.tabBarStyle  = .init(barStyle: tabBarStyle)
        
        self._selection = selection
    }
    
    public init(selection: Binding<TabItem>) {
        self.init(
            tabItemStyle : DefaultTabItemStyle(),
            tabBarStyle  : DefaultTabBarStyle(),
            selection    : selection
        )
    }
    
    public var body: some View {
        self.tabBarStyle.tabBar {
            .init(
                HStack {
                    ForEach(TabItem.allCases, id: \.self) { item in
                        self.tabItemStyle.tabItem(icon: item.icon, title: item.title, isSelected: self.selection == item)
                            .onTapGesture { [item] in
                                self.selection = item
                            }
                    }
                    .frame(maxWidth: .infinity)
                }
            )
        }
    }
    
}

extension TabBar {
    
    public func tabItem<ItemStyle: TabItemStyle>(style: ItemStyle) -> Self {
        return .init(
            tabItemStyle: style,
            tabBarStyle: self.tabBarStyle,
            selection: self._selection
        )
    }
    
    public func tabBar<BarStyle: TabBarStyle>(style: BarStyle) -> Self {
        return .init(
            tabItemStyle: self.tabItemStyle,
            tabBarStyle: style,
            selection: self._selection
        )
    }
}
