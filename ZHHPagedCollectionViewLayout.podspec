#
# Be sure to run `pod lib lint ZHHPagedCollectionViewLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZHHPagedCollectionViewLayout'
  s.version          = '0.0.1'
  s.summary          = 'collectionView分页集合视图.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  分页集合视图，从左到右滚动.
                       DESC

  s.homepage         = 'https://github.com/yue5yueliang/ZHHPagedCollectionViewLayout'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yue5yueliang' => '136769890@qq.com' }
  s.source           = { :git => 'https://github.com/yue5yueliang/ZHHPagedCollectionViewLayout.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'ZHHPagedCollectionViewLayout/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ZHHPagedCollectionViewLayout' => ['ZHHPagedCollectionViewLayout/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
