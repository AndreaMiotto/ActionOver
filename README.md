# ActionOver

A custom SwiftUI modifier to present an Action Sheet on iPhone and a Popover on iPad and Mac.

## iPhone Preview

<img src="https://user-images.githubusercontent.com/11211914/68700576-6c100580-0585-11ea-847b-99f0450311a4.gif" width="250"><img src="https://user-images.githubusercontent.com/11211914/68700574-6c100580-0585-11ea-9727-8a02ec36b118.gif" width="250">

## iPad Preview
<img src="https://user-images.githubusercontent.com/11211914/79673521-af019380-821d-11ea-82f5-49d75e83d7c0.png" width="500">

## Mac Preview
<img src="https://user-images.githubusercontent.com/11211914/79673482-7eb9f500-821d-11ea-93e0-60fc32e554ee.png" width="600">


## Features

#### Availables
- \[x] Slidable and dismissable with drag gesture.
- \[x] Light/Dark mode.
- \[x] Customizable button color.
- \[x] Custon popup position on ipad and mac.
- \[x] Custom popup arrow edge position on ipad and mac.
- \[x] iOS compatibility
- \[x] iPad compatibility
- \[x] Mac compatibility

## Installation

#### Requirements
- iOS 13.0+ / macOS 10.15+
- Xcode 11.2+
- Swift 5+

#### Via Swift Package Manager

In Xcode 11 or grater, in you project, select: `File > Swift Packages > Add Pacakage Dependency`.

In the search bar type **ActionOver** and when you find the package, with the **next** button you can proceed with the installation.

If you can't find anything in the panel of the Swift Packages you probably haven't added yet your github account.
You can do that under the **Preferences** panel of your Xcode, in the **Accounts** section.

##  How to Use

To use the **Action Over** just attach the new modifier:

```Swift
YourView
.actionOver(
    presented: Binding<Bool>,
    title: String,
    message: String?,
    buttons: [ActionOverButton],
    ipadAndMacConfiguration: IpadAndMacConfiguration,
    normalButtonColor: UIColor = UIColor.label
)
```

If you want a starting point copy in your ContentView file the following code:

```Swift
import SwiftUI
import PartialSheet


```


