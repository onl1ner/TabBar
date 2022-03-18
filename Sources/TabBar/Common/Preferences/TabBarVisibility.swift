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

import Foundation

/**
 Possible states of `TabBar's` visibility.
 
 If there is a need to hide `TabBar` you can use
 these states to control its visiblity. Changes could be
 animated by using `withAnimation` function.
 */
public enum TabBarVisibility: CaseIterable {
    /**
     After applying this state to `TabBar` it
     will be visible for the user.
     */
    case visible
    
    /**
     After applying this state to `TabBar` it will
     be hidden from the user.
     */
    case invisible
    
    /**
     A convenience function that is used to quickly switch
     between the visibility states.
     
     Use this function when you need to toggle current
     state: `visible` will become `invisible` and vice versa.
     */
    public mutating func toggle() {
        switch self {
        case .visible:
            self = .invisible
        case .invisible:
            self = .visible
        }
    }
}
