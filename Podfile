# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'Sicred' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Sicred
  pod 'RxSwift'
  pod 'RxDataSources'
  pod 'RxSwiftExt'
  pod 'Alamofire', '4.9.1'
  pod 'RxAlamofire'

  target 'SicredTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SicredUITests' do
    # Pods for testing
  end

end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      end
    end
  end
