#
# Be sure to run `pod lib lint EAAlert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EAAlert'
  s.version          = '0.1.5'
  s.summary          = 'EAAlert is a kind of customized alert view.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'EAAlert is an alert view with blurred transparent background, which contains close listener and message type.'

  s.homepage         = 'https://github.com/aydin-emre/EAAlert.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aydin-emre' => 'ea@ea.tc' }
  s.source           = { :git => 'https://github.com/aydin-emre/EAAlert.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'

  s.source_files = 'EAAlert/Classes/**/*'
  s.resources = 'EAAlert/Assets/**/*.*'
  # s.resource_bundles = {
  #   'EAAlert' => ['EAAlert/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
