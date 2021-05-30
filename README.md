# i573KW [WIP]

573KW is a project to bring China's rhythm arcade games map to mobile. i573KW is the iOS version. 

## Roadmap

 - [ ] Map Finder
 - [ ] List View
 - [ ] Shop Filter
 - [ ] i18n

## Build

Use [XcodeGen](//github.com/yonaskolb/XcodeGen) to generate Xcode project from `project.yml`:

```bash
$ xcodegen
```

Use [CocoaPods](//cocoapods.org) to install required libraries:

```bash
$ pod install
```

Obtain an API key from [AMap Open Platform](//lbs.amap.com), fill it in `i573KW/Initializer.swift`:

```swift
class Initializer {
    class func initialize() {
        AMapServices.shared().enableHTTPS = true
        AMapServices.shared().apiKey = ""   # FILL API KEY HERE
    }
}
```
