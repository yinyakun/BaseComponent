#
# Be sure to run `pod lib lint LNBaseComponent.podspec source :["",""]' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LNBaseComponent'
  s.version          = '0.0.1'
  s.summary          = '基础组件库'

  s.description      = <<-DESC
webviewcontroller 添加了进度条,位置外面传
  DESC

  s.homepage         = 'https://github.com/yinyakun/LNBaseComponent'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yinyakun' => 'yinyakun123@126.com' }
  s.source           = { :git => 'http://gitlab.xpaas.lenovo.com/yinyk1/LNBaseComponent.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'LNBaseComponent/Classes/*'
  s.subspec 'Category' do |c|
      c.source_files = 'LNBaseComponent/Classes/Category(系统类扩展)/**/*'
  end
  s.subspec 'Quantity' do |cs|
      cs.source_files = 'LNBaseComponent/Classes/Consts(常量)/**/*'
  end
  s.subspec 'Macros' do |m|
      m.source_files = 'LNBaseComponent/Classes/Macros(宏)/**/*'
  end
  s.subspec 'GDATA' do |gdxml|
      gdxml.requires_arc = false
      gdxml.source_files = 'LNBaseComponent/Classes/GDATA/**/*'
      gdxml.library    = 'xml2'
      gdxml.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  end

  #    s.subspec 'NetWorking'  do |n|
  #        n.source_files = 'LNLibBase/Classes/NetWorking/**/*'
  #        n.dependency 'AFNetworking'
  #        n.dependency 'YYKit'
  #    end
  s.subspec 'Services' do |ser|
      ser.source_files = 'LNBaseComponent/Classes/Services/**/*'
  end

  s.subspec 'Helpers'  do |hhh|
      hhh.source_files = 'LNBaseComponent/Classes/Helpers/**/*'
      hhh.dependency 'AFNetworking'
      hhh.dependency 'YYKit'
      hhh.dependency 'YTKNetwork'
      hhh.dependency 'MJExtension', '~> 3.0.13'
  end

  s.subspec 'LocalDataBase'  do |localdb|
      localdb.source_files = 'LNBaseComponent/Classes/LocalDataBase/**/*'
      localdb.dependency 'BGFMDB', '~> 2.0.9'
  end

  s.subspec 'LNBaseRequest' do |bsrq|
      bsrq.source_files = 'LNBaseComponent/Classes/LNBaseRequest/**/*'
      bsrq.dependency 'YTKNetwork'
  end
  s.subspec 'Gesture' do |ges|
      ges.source_files = 'LNBaseComponent/Classes/Gesture/**/*'
  end
  s.subspec 'LNToast'  do |ts|
      ts.source_files = 'LNBaseComponent/Classes/LNToast/**/*'
      ts.dependency 'Toast', '~> 4.0.0'
  end
  s.subspec 'LNCommonWKWebVC'  do |w|
      w.source_files = 'LNBaseComponent/Classes/LNCommonWKWebVC/**/*'
      w.dependency 'WebViewJavascriptBridge', '~> 6.0.3'
  end
  s.subspec 'MessageRedPoint'  do |redmessage|
      redmessage.source_files = 'LNBaseComponent/Classes/MessageRedPoint/**/*'
      redmessage.dependency 'CYLTabBarController', '~> 1.14.1'
  end

  s.subspec 'LNViews'  do |lv|
      lv.source_files = 'LNBaseComponent/Classes/LNViews/**/*'
  end





  # s.resource_bundles = {
  #   'LNBaseComponent' => ['LNBaseComponent/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
end
