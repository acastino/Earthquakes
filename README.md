# Earthquakes

This app shows the latest locations of the recent earthquakes worldwide. It shows them on the build-in MapKit API created by Apple, to visually show the location of the epicenter of the earthquake. It utilizes a public API provided by the United States Geological Survey (USGS) as its source of earthquake data.

The primary purpose of this app is to practice Unit Testing, as well as, accessing real-world network data over the internet.

![](/assets//images//summary.png)

## Technologies
- Swift and SwiftUI
- XCTest running on an additional project Target
- Custom Protocol for shared use between the Test cases and the actual project
- MapKit & CoreLocation packages, to format the Coordinates properly for MapKit to be able to use them
- Coordinates precision and automatic Animations, including animations during the Delete process, etc
- Multiple toolbar items with swapping, disabled and hidden State Management
- Multithreaded pre-fetching of details URLs for items within the last hour
- NSCache to avoid revisiting the same URLs again
- Custom Store conforming to ObservableObject
- Custom HTTP Client for easy use
- Conversion of USGS GeoJSON
- Automatic quake Colors
- etc.

## Screencasts

| **Quick Tour of the App** | |
| :--- | --- |
| <img src="/assets/images/app_tour.gif" width="300px"> | Shows the main features of the app. |

| **Multiple Delete** | |
| :--- | --- |
| Shows how to delete multiple entries using the extra hidden toolbar items. | <img src="/assets/images/multiple_delete.gif" width="300px"> |

| **Caching feature** | |
| :--- | --- |
| <img src="/assets/images/caching.gif" width="300px"> | Coordinates within the last hour are pre-loaded during App launch, and on Refresh. Entries after that load their respective Coordinates data asynchronously when the User taps their corresponding rows. If internet is not available by the time they tap on a row that does not have its corresponding Coordinates data, the Map is not shown, and the Details will only show whatever data is known from the List page until the network request is fullfilled, which will then automatically show the Map and so on. |

<sub>All Rights Reserved ©️ 2023</sub>