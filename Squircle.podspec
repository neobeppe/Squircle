
Pod::Spec.new do |s|
  s.name             = 'Squircle'
  s.version          = '1.0.0'
  s.summary          = 'Squircle rounding corner for UIView'


  s.description      = <<-DESC
Lightweight library to apply a squircle rounded corner to any UIView.
You can apply 
                       DESC

  s.homepage         = 'https://github.com/AlphaSheeps/Squircle'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Giuseppe Travasoni' => 'giuseppe.travasoni@gmail.com' }
  s.source           = { :git => 'https://github.com/AlphaSheeps/Squircle.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'Squircle/**/*'
  s.frameworks = 'UIKit'
  
  s.swift_version = '4.0'
  
end
