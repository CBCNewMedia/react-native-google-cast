require 'json'
package = JSON.parse(File.read(File.join(__dir__, '../', 'package.json')))
package_name = "react-native-google-cast"

Pod::Spec.new do |s|
  s.name          = package_name
  s.version       = package['version']
  s.summary       = package['description']

  s.author        = { 'petrbela' => 'github@petrbela.com' }
  s.homepage      = 'https://github.com/react-native-google-cast/react-native-google-cast'
  s.license       = package['license']
  s.platform      = :ios, '9.0'

  s.source        = { :git => 'https://github.com/react-native-google-cast/react-native-google-cast.git', :tag => s.version.to_s }
  s.source_files  = 'RNGoogleCast/**/*.{h,m}'
  s.default_subspec = 'NoBluetooth'

  s.dependency      'React'

  s.subspec 'Default' do |ss|
    ss.dependency "#{package_name}/RNGoogleCast"
    ss.dependency 'google-cast-sdk', '<= 4.4.4'
  end

  s.subspec 'NoBluetooth' do |ss|
    ss.dependency "#{package_name}/RNGoogleCast"
    ss.dependency 'google-cast-sdk-no-bluetooth'
  end

  s.subspec 'Manual' do |ss|
    ss.dependency "#{package_name}/RNGoogleCast"
  end

  s.subspec 'RNGoogleCast' do |ss|
    ss.source_files = 'RNGoogleCast/**/*.{h,m}'
  end
end
