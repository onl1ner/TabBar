Pod::Spec.new do |spec|

  spec.name          = "TabBar"
  spec.version       = "1.0.0"
  spec.summary       = "TabBar – highly customized tab bar for your SwiftUI application."

  spec.platform      = :ios, '13.0'
  spec.framework     = 'Foundation', 'SwiftUI'

  spec.swift_version = ['5.1']
 
  spec.homepage      = "https://github.com/onl1ner/TabBar"
   
  spec.source        = { :git => "https://github.com/onl1ner/TabBar.git", :tag => "#{spec.version}" }
 
  spec.license       = { :type => "MIT", :file => "LICENSE" }
  spec.author        = { "Tamerlan Satualdypov" => "tsatualdypov@gmail.com" }
  
  spec.source_files  = "Sources/TabBar/**/*.swift"
  
end