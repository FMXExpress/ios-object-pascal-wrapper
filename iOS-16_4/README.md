# iPhoneOS 16.4 Pascal wrapper

Imported with SDKTransform from RAD Studio 11.3 Alexandria and [SDKTransform Assistant](https://github.com/DeveloppeurPascal/delphi-sdktransform/tree/master/SDKTransformAssistant).

iOS 16.4 was bind into Xcode 13.4.1 (june 2023).

Those frameworks have been added with the path $(SDKROOT)/System/Library/Frameworks to the default RAD Studio iOS SDK frameworks list :

Accounts
AudioUnit
AVKit
CloudKit
CoreAudioKit
CoreBluetooth
CoreData
CoreMotion
EventKit
EventKitUI
ExternalAccessory
GameController
GameKit
GSS
HealthKit
HomeKit
IOKit
MediaAccessibility
MultipeerConnectivity
NetworkExtension
NewsstandKit
OpenAL
PassKit
Photos
PhotosUI
PushKit
QuickLook
SceneKit
Social
SpriteKit
Twitter
VideoToolbox

Add the ones you need to your iPhoneOS or iPhoneSimulator SDK and refresh the files in Tools / Options / Deployment / SDK Manager.

Before using a "fresh" API in a program, don't forget to check Apple documentation and add a test of current i(Pad)OS version to prevent app crashes by using too recent API.
