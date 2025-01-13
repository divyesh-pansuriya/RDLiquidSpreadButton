Pod::Spec.new do |spec|
  spec.name         = 'RDLiquidSpreadButton'
  spec.version      = '1.0'
  spec.summary      = 'A customizable liquid spread button with smooth animations for iOS.'
  spec.description  = 'A button for iOS that creates a liquid spreading animation when clicked. It is customizable and can be easily integrated with both UIKit and SwiftUI.'
  spec.homepage     = 'https://github.com/divyesh-pansuriya/RDLiquidSpreadButton'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'Divyesh Pansuriya' => 'adpansuriya2000@gmail.com' }
  spec.source       = { :git => 'https://github.com/divyesh-pansuriya/RDLiquidSpreadButton.git', :tag => spec.version.to_s }
  spec.ios.deployment_target = '15.0'
spec.swift_version = '5.0'  # Add Swift version here
  spec.source_files = 'RDLiquidSpreadButton/Classes/**/*.{h,m,swift}'
  spec.frameworks   = 'UIKit'
  spec.requires_arc = true
end
