Pod::Spec.new do |spec|
  spec.name          = 'coreLib'
  spec.version       = '1.0.0'
  spec.summary       = 'Core Library for NoMansLand'
  spec.description   = 'This is an Core Library which will help us in achieving nothing'
  spec.homepage      = 'https://github.com/arunad-ios/inventory_cocoa'
  spec.author        = { 'arunad-ios' => 'arunakumari.d@cartrade.com' }
  spec.license       = { :type => 'MIT', :file => 'FILE_LICENSE' }
  spec.source        = { :git => 'https://github.com/arunad-ios/inventory_cocoa.git', :tag => spec.version.to_s }
  spec.swift_version = '5.0'
  spec.ios.deployment_target = '13.0'
 spec.source_files  = "inventory_cocoa/**/*.{h,m,swift}","inventory_cocoa/*.{h,m,swift}"
  spec.resources = 'inventory_cocoa/*.xcdatamodeld'




 # spec.ios.vendored_frameworks = [
  #  "Frameworks/auth_library.xcframework",
   # "Frameworks/analytics_library.xcframework"
  #]
end
