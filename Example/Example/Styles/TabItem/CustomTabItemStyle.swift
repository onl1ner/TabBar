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
import TabBar

struct CustomTabItemStyle: TabItemStyle {
    
    public func tabItem(_ tabItem: any Tabbable, isSelected: Bool, badgeNumber: Int?) -> some View {
        ZStack {
            if isSelected {
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 40.0, height: 40.0)
            }
            
            Image(systemName: tabItem.icon)
                .foregroundColor(isSelected ? .white : Color("color.tab.item.foreground"))
                .frame(width: 32.0, height: 32.0)
            
            if let badgeNumber = badgeNumber, badgeNumber > 0 {
                Text("\(badgeNumber < 100 ? String(badgeNumber) : "99+")")
                    .font(.callout)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .background(
                        Capsule()
                            .foregroundColor(.red)
                    )
                    .offset(x: 26, y: -10)
            }
        }
        .padding(.vertical, 8.0)
    }
    
}
