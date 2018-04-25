#
# Be sure to run `pod lib lint CMCountDownButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CMCountDownButton'
  s.version          = '0.1.0'
  s.summary          = '倒计时按钮封装'

  s.homepage         = 'https://github.com/JKshared92/CMCountDownButton'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'comma' => '506702341@qq.com' }
  s.source           = { :git => 'https://github.com/JKshared92/CMCountDownButton.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'CMCountDownButton/Classes/**/*'
  s.frameworks = 'UIKit'
  s.dependency 'MSWeakTimer'
end
