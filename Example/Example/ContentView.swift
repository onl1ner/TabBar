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
    
    private enum Item: Tabbable {
        case home
        case search
        case profile
        
        var icon: Image {
            switch self {
            case .home:
                return Image(systemName: "house")
            case .search:
                return Image(systemName: "magnifyingglass")
            case .profile:
                return Image(systemName: "person")
            }
        }
        
        var title: String {
            switch self {
            case .home:
                return "First"
            case .search:
                return "Second"
            case .profile:
                return "Third"
            }
        }
    }
    
    @State private var selection: Item = .home
    @State private var visibility: TabBarVisibility = .visible
    
    var body: some View {
        TabBar(selection: $selection, visibility: $visibility) {
            Button {
                withAnimation(.spring()) {
                    visibility.toggle()
                }
            } label: {
                Text("Hide/Show TabBar")
            }
            .tabItem(for: Item.home)
            
            Text("Second")
                .tabItem(for: Item.search)
            
            Text("Third")
                .tabItem(for: Item.profile)
        }
//        Uncomment these two lines below to apply
//        custom tab bar and tab item styles to
//        the tab bar.
//
//        .tabBar(style: CustomTabBarStyle())
//        .tabItem(style: CustomTabItemStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
