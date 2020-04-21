# EAAlert

[![CI Status](https://img.shields.io/travis/aydin-emre/EAAlert.svg?style=flat)](https://travis-ci.org/aydin-emre/EAAlert)
[![Version](https://img.shields.io/cocoapods/v/EAAlert.svg?style=flat)](https://cocoapods.org/pods/EAAlert)
[![License](https://img.shields.io/cocoapods/l/EAAlert.svg?style=flat)](https://cocoapods.org/pods/EAAlert)
[![Platform](https://img.shields.io/cocoapods/p/EAAlert.svg?style=flat)](https://cocoapods.org/pods/EAAlert)

![EAAlert example](https://i.ibb.co/qk96H0P/screenshot1.png)
![EAAlert example](https://i.ibb.co/WsZfd02/screenshot2.png)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

EAAlert is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EAAlert'
```

## How To Use

Firstly, import EAAlert to your project
```swift
import EAAlert
```

Define EAAlert variable in global scope
```swift
var alert: EAAlert!
```
Set the instance in viewDidLoad
```swift
alert = EAAlert()
alert = EAAlert(message: "Test message")
```
To show alert
```swift
alert.show()
```
You can set the message with using setMessage function when you need
```swift
alert.setMessage("Updated message")
```
Set message type as success, error or none. There will be icons if success or error selected.
```swift
alert.messageType = .success // .error or .none
```
Set positive and negative button visibility
```swift
alert.isPositiveButtonHidden = false // default true
alert.isNegativeButtonHidden = false // default true
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
alert.positiveButtonTextFont = UIFont.boldSystemFont(ofSize: 23)
alert.positiveButtonTextColor = .white
alert.positiveButtonText = "Ok"

alert.negativeButtonTextFont = UIFont.boldSystemFont(ofSize: 23)
alert.negativeButtonTextColor = .white
alert.negativeButtonText = "Cancel"
```

## Author

aydin-emre, www.emr.ee

## License

EAAlert is available under the MIT license. See the LICENSE file for more info.
