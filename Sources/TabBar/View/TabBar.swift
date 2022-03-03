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


public struct TabBar<TabItem: Tabbable, Content: View>: View {
    
    @State private var items: [TabItem]
    
    @Binding private var visibility: TabBarVisibility
    
    private let selectedItem: TabBarSelection<TabItem>
    
    private let tabItemStyle : AnyTabItemStyle
    private let tabBarStyle  : AnyTabBarStyle
    
    private let content: Content
    
    private init<ItemStyle: TabItemStyle, BarStyle: TabBarStyle>(
        tabItemStyle : ItemStyle,
        tabBarStyle  : BarStyle,
        selection    : Binding<TabItem>,
        visibility   : Binding<TabBarVisibility>,
        @ViewBuilder content: () -> Content
    ) {
        self.selectedItem = .init(selection: selection)
        
        self.tabItemStyle = .init(itemStyle: tabItemStyle)
        self.tabBarStyle  = .init(barStyle: tabBarStyle)
        
        self.content = content()
        
        self._items = .init(initialValue: .init())
        self._visibility = visibility
    }
    
    public init(
        selection: Binding<TabItem>,
        visibility: Binding<TabBarVisibility>,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            tabItemStyle : DefaultTabItemStyle(),
            tabBarStyle  : DefaultTabBarStyle(),
            selection    : selection,
            visibility   : visibility,
            content      : content
        )
    }
    
    private var tabItems: some View {
        HStack {
            ForEach(self.items, id: \.self) { item in
                self.tabItemStyle.tabItem(icon: item.icon, title: item.title, isSelected: self.selectedItem.selection == item)
                    .onTapGesture { [item] in
                        self.selectedItem.selection = item
                        self.selectedItem.objectWillChange.send()
                    }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    public var body: some View {
        ZStack {
            self.content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .environmentObject(self.selectedItem)
            
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    
                    self.tabBarStyle.tabBar(with: geometry) {
                        .init(self.tabItems)
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
                .visibility(self.visibility)
            }
        }
        .onPreferenceChange(TabBarPreferenceKey.self) { value in
            self.items = value
        }
    }
    
}

extension TabBar {
    
    public func tabItem<ItemStyle: TabItemStyle>(style: ItemStyle) -> Self {
        return .init(
            tabItemStyle : style,
            tabBarStyle  : self.tabBarStyle,
            selection    : self.selectedItem.$selection,
            visibility   : self.$visibility,
            content      : { self.content }
        )
    }
    
    public func tabBar<BarStyle: TabBarStyle>(style: BarStyle) -> Self {
        return .init(
            tabItemStyle : self.tabItemStyle,
            tabBarStyle  : style,
            selection    : self.selectedItem.$selection,
            visibility   : self.$visibility,
            content      : { self.content }
        )
    }
}
