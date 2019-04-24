
Pod::Spec.new do |s|
  s.name             = 'Squircle'
  s.version          = '2.0.0'
  s.summary          = 'Squircle rounding corner for UIView'


  s.description      = <<-DESC
Lightweight library to apply a squircle rounded corner to any UIView.
                       DESC

  s.homepage         = 'https://github.com/neobeppe/Squircle'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Giuseppe Travasoni' => 'giuseppe.travasoni@gmail.com' }
  s.source           = { :git => 'https://github.com/neobeppe/Squircle.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'Squircle/**/*'
  s.frameworks = 'UIKit', 'QuartzCore', 'CoreGraphics'
  
  s.swift_version = '5.0'
  
end
