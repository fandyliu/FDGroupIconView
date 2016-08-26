Pod::Spec.new do |s|
s.name         = 'FDGroupIconView'
s.version      = '0.2.0'
s.summary      = 'Setup Group Icon more easier. You just need One line is enough.'
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.authors      = { 'fandylau' => 'fandylau2011@outlook.com' }
# s.social_media_url   = 'http://twitter.com/liuhuan'
s.homepage     = 'https://github.com/FandyLiu/FDGroupIconView'
s.platform     = :ios, '7.0'
s.ios.deployment_target = '7.0'
s.source       = { :git => 'https://github.com/FandyLiu/FDGroupIconView.git', :tag => s.version, :submodules => true  }
s.requires_arc = true

s.source_files = 'FDGroupIconView/**/*.{h,m}'
s.public_header_files = 'FDGroupIconView/**/*.{h}'
s.resource_bundles = { 'FDGroupIconView' => ['FDGroupIconView/FDGroupIconResource.bundle/*.png'] }

s.frameworks = 'UIKit'
s.dependency 'SDWebImage', '~> 3.7.5'
# s.library   = 'iconv'
# s.libraries = 'iconv', 'xml2'


end
