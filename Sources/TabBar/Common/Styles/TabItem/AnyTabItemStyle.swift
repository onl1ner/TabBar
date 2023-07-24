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

/**
 Type eraser which is used to represent
 any style of `TabBar's` item.
 
 Use this type only when there is a necessity
 to represent any item style.
 */
public struct AnyTabItemStyle: TabItemStyle {
    private let _makeTabItem: (any Tabbable, Bool, Int?) -> AnyView
    
    public init<TabItem: TabItemStyle>(itemStyle: TabItem) {
        self._makeTabItem = itemStyle.tabItemErased(_:isSelected:badgeNumber:)
    }
    
    public func tabItem(_ tabItem: any Tabbable, isSelected: Bool, badgeNumber: Int?) -> some View {
        return self._makeTabItem(tabItem, isSelected, badgeNumber)
    }
}
