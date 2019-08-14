### React native 集成到iOS 项目中
RN版本：0.60.4
Xcode: 10.3


#### 一、集成React Native 项目到原生工程中

在iOS项目同级目录下创建
- index.js react-native 入口文件
- package.json   react-native 的依赖包和原来RN工程保持一致即可

创建完成后， `npm install`

Podfile
```
# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
# Comment the next line if you don't want to use dynamic frameworks
# use_frameworks!


target 'Mall' do


# 'node_modules'目录一般位于根目录中
pod 'React', :path => '../node_modules/react-native/'
pod 'React-Core', :path => '../node_modules/react-native/React'
pod 'React-DevSupport', :path => '../node_modules/react-native/React'
pod 'React-fishhook', :path => '../node_modules/react-native/Libraries/fishhook'
pod 'React-RCTActionSheet', :path => '../node_modules/react-native/Libraries/ActionSheetIOS'
pod 'React-RCTAnimation', :path => '../node_modules/react-native/Libraries/NativeAnimation'
pod 'React-RCTBlob', :path => '../node_modules/react-native/Libraries/Blob'
pod 'React-RCTImage', :path => '../node_modules/react-native/Libraries/Image'
pod 'React-RCTLinking', :path => '../node_modules/react-native/Libraries/LinkingIOS'
pod 'React-RCTNetwork', :path => '../node_modules/react-native/Libraries/Network'
pod 'React-RCTSettings', :path => '../node_modules/react-native/Libraries/Settings'
pod 'React-RCTText', :path => '../node_modules/react-native/Libraries/Text'
pod 'React-RCTVibration', :path => '../node_modules/react-native/Libraries/Vibration'
pod 'React-RCTWebSocket', :path => '../node_modules/react-native/Libraries/WebSocket'

pod 'React-cxxreact', :path => '../node_modules/react-native/ReactCommon/cxxreact'
pod 'React-jsi', :path => '../node_modules/react-native/ReactCommon/jsi'
pod 'React-jsiexecutor', :path => '../node_modules/react-native/ReactCommon/jsiexecutor'
pod 'React-jsinspector', :path => '../node_modules/react-native/ReactCommon/jsinspector'
pod 'yoga', :path => '../node_modules/react-native/ReactCommon/yoga'

pod 'DoubleConversion', :podspec => '../node_modules/react-native/third-party-podspecs/DoubleConversion.podspec'
pod 'glog', :podspec => '../node_modules/react-native/third-party-podspecs/glog.podspec'
pod 'Folly', :podspec => '../node_modules/react-native/third-party-podspecs/Folly.podspec'

pod 'RNGestureHandler', :path => '../node_modules/react-native-gesture-handler'
pod 'react-native-webview', :path => '../node_modules/react-native-webview'

end
```
注意重要一点，无法找到头文件的解决方法
点` targets`，选` Build Settings`
搜 `HEADER_SEARCH_PATHS`，添加一项`$(SRCROOT)/../node_modules/react-native/React`，选择 `recursive`
