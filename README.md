# TabBar

![](https://img.shields.io/badge/platform-iOS-lightgrey)
![](https://img.shields.io/badge/iOS-13.0%2B-blue)
![](https://img.shields.io/badge/Swift-5-orange?logo=Swift&logoColor=white)

`SwiftUI` standard `TabView` component is not so flexible and to customize it you have to modify appearance proxy of `UITabBar` or implement your own one from scratch. The goal of this library is to solve this problem.

## Table of contents

* [Requirements](#requirements)
* [Installation](#installation)
    * [Swift Package Manager](#swift-package-manager)
* [Usage](#usage)
    * [Customization](#customization)
* [Contribution](#contribution)
* [License](#license)

## Requirements

- SwiftUI
- iOS 13.0 or above

## Installation

**TabBar** is available through [Swift Package Manager](https://github.com/apple/swift-package-manager)

### Swift Package Manager
- In Xcode select: 

  ```
  File > Swift Packages > Add Package Dependency...
  ```
  
- Then paste this URL: 

  ```
  https://github.com/onl1ner/TabBar.git
  ```
  
## Usage

To start using `TabBar` you have to create an enum which will implement `Tabbable` protocol:

```swift
enum Item: Int, Tabbable {
    case first = 0
    case second
    case third
    
    var icon: String {
        switch self {
            case .first:  // Name of icon of first item.
            case .second: // Name of icon of second item.
            case .third:  // Name of icon of third item.
        }
    }
    
    var title: String {
        switch self {
            case .first:  // Title of first item.
            case .second: // Title of second item.
            case .third:  // Title of third item.
        }
    }
}
```

After that you will be able to create `TabBar` instance:

```swift
struct ContentView: View {
    @State private var selection: Item = .first
    @State private var visibility: TabBarVisibility = .visible

    var body: some View {
        TabBar(selection: $selection, visibility: $visibility) {
            Text("First")
                .tabItem(for: Item.first)
            
            Text("Second")
                .tabItem(for: Item.second)
            
            Text("Third")
                .tabItem(for: Item.third)
        }
        .tabBar(style: CustomTabBarStyle())
        .tabItem(style: CustomTabItemStyle())
    }
}
```

After these actions tab bar with default style will be created.

### Customization

`TabBar` component is highly customizable. This is achieved by introducing `TabBarStyle` and `TabItemStyle` protocols. By implementing each of the protocol you will be able to build your custom tab bar. **NOTE** that `TabBar` automaticaly pushes down to bottom any of tab bar styles.

After creating your custom styles you may inject them to your tab bar by using `tabBar(style:)` and `tabItem(style:)` functions. Here is the showcase of default style and one of the examples of what you can achieve by customizing tab bar:

![](https://github.com/onl1ner/onl1ner/blob/master/Resources/TabBar/Showcase.png?raw=true)

## Contribution

If you struggle with something feel free to [open an issue](https://github.com/onl1ner/TabBar/issues/new). Pull requests are also appreciated.

## License

**TabBar** is under the terms and conditions of the MIT license.

```
MIT License

Copyright (c) 2021 Tamerlan Satualdypov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

