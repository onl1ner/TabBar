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

struct TabBarViewModifier<TabItem: Tabbable>: ViewModifier {
    @EnvironmentObject private var selectionObject: TabBarSelection<TabItem>
    
    let item: TabItem
    
    func body(content: Content) -> some View {
        Group {
            if self.item == self.selectionObject.selection {
                content
            } else {
                Color.clear
            }
        }
        .preference(key: TabBarPreferenceKey.self, value: [self.item])
    }
}

extension View {
    /**
     A function that is used to associated view with the passed item.
     
     Use this function to associate view with the specific item
     of the `TabBar`.
     */
    public func tabItem<TabItem: Tabbable>(for item: TabItem) -> some View {
        return self.modifier(TabBarViewModifier(item: item))
    }
}
