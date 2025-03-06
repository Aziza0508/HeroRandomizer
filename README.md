# 🦸‍♂️ HeroRandomizer App  

## 📌 Overview  
**HeroRandomizer** is an iOS application that displays random superheroes from the [Superhero API](https://akabab.github.io/superhero-api/). Each time the user taps a button, a new superhero's details are fetched and displayed.  

This project demonstrates:  
- UIKit project setup  
- SwiftUI integration in a UIKit app using `UIHostingController`  
- Networking with `URLSession` and JSON parsing  
- Data modeling  
- UI design and smooth user interactions  

## 🎯 Features  
✅ Fetches and displays random superheroes from the API  
✅ Shows at least **10 attributes** of each superhero  
✅ Integrated SwiftUI views within a UIKit app  
✅ Handles loading states and API errors gracefully

---

## ⚙️ Technical Details  

### Project Structure  
- **UIKit Setup**: The project uses UIKit as the base, with `SceneDelegate` setting up the root view controller.  
- **SwiftUI Integration**: The main UI is built with SwiftUI and embedded using `UIHostingController`.  
- **Networking**: `URLSession` is used to fetch superhero data.  
- **Data Model**: The response JSON is mapped to a `Superhero` struct using `Codable`.  
- **State Management**: SwiftUI’s `@StateObject` is used to manage data updates.  

### API Details  
- **Base URL**: `https://akabab.github.io/superhero-api/`  
- **Hero List Endpoint**: `https://akabab.github.io/superhero-api/api/all.json`  
- **Fetching Strategy**: The app loads all heroes once, stores them in an array, and selects a random hero upon button press.  

