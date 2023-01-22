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
 A type that represents tab item style.
 
 This type is used by `TabBar` to apply custom styles to its items.
 You can easily pass your custom item style to `TabBar` by
 using `tabItem(style:)` function.
 */
public protocol TabItemStyle {
    associatedtype Content : View
    
    func tabItem(icon: String, title: String, isSelected: Bool) -> Content
    func tabItem(icon: String, selectedIcon: String, title: String, isSelected: Bool) -> Content
}

extension TabItemStyle {
    public func tabItem(icon: String, title: String, isSelected: Bool) -> Content {
        return self.tabItem(icon: icon, selectedIcon: icon, title: title, isSelected: isSelected)
    }
    
    public func tabItem(icon: String, selectedIcon: String, title: String, isSelected: Bool) -> Content {
        return self.tabItem(icon: icon, title: title, isSelected: isSelected)
    }
    
    func tabItemErased(icon: String, selectedIcon: String, title: String, isSelected: Bool) -> AnyView {
        return .init(self.tabItem(icon: icon, selectedIcon: selectedIcon, title: title, isSelected: isSelected))
    }
}
