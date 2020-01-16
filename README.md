# EAAlert

[![CI Status](https://img.shields.io/travis/aydin-emre/EAAlert.svg?style=flat)](https://travis-ci.org/aydin-emre/EAAlert)
[![Version](https://img.shields.io/cocoapods/v/EAAlert.svg?style=flat)](https://cocoapods.org/pods/EAAlert)
[![License](https://img.shields.io/cocoapods/l/EAAlert.svg?style=flat)](https://cocoapods.org/pods/EAAlert)
[![Platform](https://img.shields.io/cocoapods/p/EAAlert.svg?style=flat)](https://cocoapods.org/pods/EAAlert)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

EAAlert is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```swift
pod 'EAAlert'
```

## How To Use

Firstly, import EAAlert to your project
```swift
import EAAlert
```

Defite EAAlert variable in global scope
```swift
var alert: EAAlert!
```
Set the instance at viewDidLoad
```swift
alert = EAAlert(message: "test message")
```
You can set the message when needed with using setMessage function
```swift
alert.setMessage("updated message")
```
Set message type as success, error or none. There will be icons if success or error selected.
```swift
alert.messageType = .success // .error or .none
```
Set positive and negative button visibility
```swift
alert.isPositiveButtonHidden = false // default true
alert.isPositiveButtonHidden = false // default true
```

## Click events
onAlertCloseTapped, onNegativeButtonTapped, and onPositiveButtonTapped
```swift
alert.onAlertCloseTapped = {
    print("onAlertCloseTapped")
}

alert.onNegativeButtonTapped = {
    print("onNegativeButtonTapped")
}

alert.onPositiveButtonTapped = {
    print("onPositiveButtonTapped")
}
```

## Customize
You can change close, success and error icons.
```swift
alert.closeButtonImage = UIImage(named: "close")
alert.successButtonImage = UIImage(named: "tick")
alert.errorButtonImage = UIImage(named: "cross")
```
Update alert background color and set blur type
```swift
alert.blurEffectStyle = .dark
alert.alertBackgroundColor = .black
```
Set message label font and color
```swift
alert.messageLabelFont = UIFont.systemFont(ofSize: 20)
alert.messageLabelColor = .lightText
```
Set positive and negative buttons' text, font, and color
```swift
alert.isPositiveButtonHidden = false
alert.positiveButtonTextFont = UIFont.boldSystemFont(ofSize: 23)
alert.positiveButtonTextColor = .white
alert.positiveButtonText = "Ok"

alert.isNegativeButtonHidden = false
alert.negativeButtonTextFont = UIFont.boldSystemFont(ofSize: 23)
alert.negativeButtonTextColor = .white
alert.negativeButtonText = "Cancel"
```

## Author

aydin-emre, ea@ea.tc

## License

EAAlert is available under the MIT license. See the LICENSE file for more info.
