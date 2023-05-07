# Facetcher App

Facetcher is a mobile app to turn your hand drawing sketch into a realistic face.

# Screens

<img src="https://user-images.githubusercontent.com/102770811/236689485-db05beca-716e-4e9a-ada1-1b2ecac1e5da.jpg" alt="Image description" width="250"/>   <img src="https://user-images.githubusercontent.com/102770811/236689495-03db2313-624d-49e4-9f3e-ce2a4e540468.jpg" alt="Image description" width="250"/>   <img src="https://user-images.githubusercontent.com/102770811/236689502-c43f0f44-c080-4024-83a2-6bb3bda9bd03.jpg" alt="Image description" width="250"/>

# Getting Started

Facetcher is an app designed to generating images of human face based on hand drawing sketches. The app has a user-friendly interface that makes it easy for users to create facial sketches and generate images of suspects.
To use the app, users first provide basic case details such as the title, gender, and description. They can then begin drawing the facial sketch using the app's intuitive drawing tools. Once the sketch is complete, the app generates an image of the suspect based on the sketch.
Users can edit the sketch until they are happy with the result. Once the user is satisfied with the generated image, they can submit the sketch along with case details and the generated image to the app.
The app also provides a history screen that displays all the cases submitted by the user, allowing them to easily access past sketches and results. Users can export the generated image as a PDF file for convenient saving and sharing..

# How to Use

Certainly! To run the Facetcher app, you will need to follow a few steps:

- Download and install Android Studio on your computer.
- Download or clone [Facetcher app](https://github.com/henry-azer/facetcher-app) repository by using the link below:
```
https://github.com/zubairehman/flutter-boilerplate-project.git
```
- Open Android Studio and select "Open an existing Android Studio project" from the welcome screen.
- Navigate to the directory where you cloned the Facetcher app repository and select the project folder.
- Go to project root and execute the following command in console to get the required dependencies:
```
flutter pub get
```
- Once the project has finished loading, you can either connect your Android device to your computer using a USB cable or create an emulator in Android Studio.
- If you're using a physical device, make sure to enable USB debugging mode on your phone by going to "Developer options" in your phone's settings and toggling the "USB debugging" option.
- Select the device you want to run the app on by clicking on the device dropdown menu in Android Studio.
- Finally, Run the app.
```
flutter run
```

By following these steps, you should be able to run the Facetcher app on your Android device or emulator without any issues. However, keep in mind that the exact process may vary depending on your specific setup and the version of Android Studio you are using.

# Folder Structure

```
├──  android 
|    └── app/ - This folder contains the main Android application code.
|    └── gradle/wrapper/ - This folder contains the Gradle wrapper and related files.
│    
│
├──  assets/fonts/ - This folder contains the fonts used in the app.
│    
│
├──  ios
│    └── Flutter/ - This folder contains the Flutter engine and framework code that is used to build and run the app on iOS.
|    └── Runner/ - This folder contains the main iOS application code, resources, and configurations.
│    
│
├──  lang - This folder contains the languages used in the app.
│    └── ar.json 
│    └── en.json  
|
|
├──  lib - This folder contains the Dart source code for the app's user interface and business logic.
│    └── config/
|    └── core/
|    └── data/
|    └── features/
|    └── app.dart
|    └── bloc_observer.dart
|    └── injection_container.dart
|    └── main.dart
│
│
├──  test - The "test" folder in a Flutter project contains the test code for the app.
     └── widget_test.dart
```

# Features

Here is a summary of the features Facetcher provides:

- Login system: Users can create an account and log in to the app to access its features.
- Home screen: The home screen displays the user's name and provides access to the user profile, history, and options bar.
- Sketch creation: Users can create facial sketches by providing the title of the case, the gender of the desired human, and a description of the case.
- Result generation: The app generates a realistic based on the user's sketch.
- Editing: Users can edit and refine their sketches if they are not satisfied with the generated result.
- Submission: Users can submit their sketches along with case details and generated images to the app.
- History: The app provides a history screen that displays all the cases submitted by the user.
- PDF export: Users can export the generated image as a PDF file for convenient saving and sharing.
- Profile management: Users can manage their personal data, log out, and change their password.

# Libraries & Tools Used

- [Dio](https://github.com/cfug/dio)
- [Database](https://github.com/tekartik/sembast.dart)
- [MobX](https://github.com/mobxjs/mobx.dart)
- [Provider](https://github.com/rrousselGit/provider)
- [Encryption](https://github.com/xxtea/xxtea-dart)
- [Validation](https://github.com/dart-league/validators)
- [Logging](https://github.com/zubairehman/Flogs)
- [Notifications](https://github.com/AndreHaueisen/flushbar)
- [Json Serialization](https://github.com/google/json_serializable.dart)
- [Dependency Injection](https://github.com/fluttercommunity/get_it)
