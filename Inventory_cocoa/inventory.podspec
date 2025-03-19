

Pod::Spec.new do |s|
  s.name             = 'inventory'
  s.version          = '1.0.0'
  s.summary          = 'Inventory '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "inventory Module of Cartradeexchange App"

  s.homepage         = 'https://github.com/arunad-ios/inventory_cocoa'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'arunad-ios' => 'arunakumari.d@cartrade.com' }
  s.source           = { :git => 'https://github.com/arunad-ios/inventory_cocoa.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  # s.source_files = 'Inventory_cocoa/**'
   
   
    # ✅ Correct path
    s.source_files  = "**/*.swift"

   
# InventorySwiftCocoapods/Classes/**/*

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'Alamofire', '~> 5.0'
end
