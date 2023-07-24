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

struct ContentView: View {
    
    private enum Item: Int, Tabbable {
        case first = 0
        case second
        case third
        
        var icon: String {
            switch self {
                case .first: return "house"
                case .second: return "magnifyingglass"
                case .third: return "person"
            }
        }
        
        var title: String {
            switch self {
                case .first: return "First"
                case .second: return "Second"
                case .third: return "Third"
            }
        }
    }
    
    @State private var selection: Item = .first
    @State private var visibility: TabBarVisibility = .visible
    @State private var badgeNumberAtThird = 0
    
    var body: some View {
        TabBar(
            selection: $selection,
            visibility: $visibility
        ) {
            Button {
                withAnimation {
                    visibility.toggle()
                }
            } label: {
                Text("Hide/Show TabBar")
            }
            .tabItem(for: Item.first)
            
            Text("Second")
                .tabItem(for: Item.second)
            
            VStack(spacing: 40) {
                Text("Third")
                
                Button {
                    badgeNumberAtThird += 1
                } label: {
                    Text("Increase Badge Number")
                }
                
                Button {
                    badgeNumberAtThird = 0
                } label: {
                    Text("Reset Badge Number")
                }
            }
            .tabItem(for: Item.third, badgeNumber: badgeNumberAtThird)
        }
        .tabBar(style: CustomTabBarStyle())
        .tabItem(style: CustomTabItemStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
