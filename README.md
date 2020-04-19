# ActionOver

A custom SwiftUI modifier to present an Action Sheet on iPhone and a Popover on iPad and Mac.

## iPhone Preview

<img src="https://user-images.githubusercontent.com/11211914/79682692-94eca300-8267-11ea-8cd3-a23daf3de982.png" width="250"><img src="https://user-images.githubusercontent.com/11211914/79682686-8c946800-8267-11ea-8d87-c03c4ca89882.png" width="250">

## iPad Preview
<img src="https://user-images.githubusercontent.com/11211914/79682766-370c8b00-8268-11ea-8ef4-974e91396490.png" width="500">

## Mac Preview
<img src="https://user-images.githubusercontent.com/11211914/79682737-fb71c100-8267-11ea-9a2b-c73a952d2839.png" width="568">


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

struct ContentView: View {

    @State var presented = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 40) {
                Text("""
                Hi, this is the Action Over modifier.

                With this modifier you will preset an Action Sheet on iPhone
                and a Popover on iPad and Mac.

                You will write just once your actions, and with a single modifier
                you will dislay the proper menu according the user's device.
                """)
                Button(action: {
                    self.presented = true
                }, label: {
                    Text("Show Action Over")
                })
                    .actionOver(
                        presented: $presented,
                        title: "Settings",
                        message: "Wich setting will you enamble?",
                        buttons: buttons,
                        ipadAndMacConfiguration: ipadMacConfig
                )
                HStack {
                    Spacer()
                }
                Spacer()
            }
            .padding()
                .navigationBarTitle("Action Over", displayMode: .large)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private var buttons: [ActionOverButton] = {
        return [
            ActionOverButton(
                title: "Option one",
                type: .normal,
                action: {}
            ),
            ActionOverButton(
                title: "Option two",
                type: .normal,
                action: {}
            ),
            ActionOverButton(
                title: "Delete",
                type: .destructive,
                action: {}
            ),
            ActionOverButton(
                title: nil,
                type: .cancel,
                action: nil
            ),
        ]
    }()

    private var ipadMacConfig = {
        IpadAndMacConfiguration(anchor: nil, arrowEdge: nil)
    }()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

```


