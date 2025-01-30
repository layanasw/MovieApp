# 📽️ Movie App - SwiftUI
An intuitive and modern iOS movie app built using SwiftUI, designed to provide users with a seamless experience for discovering movies, viewing details, and saving their favorites.



# 📌 Features

-  Fetches movies and directors from an external API
-  Displays movie details, including IMDb rating, story, language, and runtime
-  Shows directors with their images in the Movie Details Page
-  Saves movies to Favorites
-  Clean and responsive SwiftUI UI design


# ⚙️ Technologies & Tools Used

- SwiftUI - Modern declarative UI framework
- Combine - Handling asynchronous data flow
- URLSession - Fetching movie & director data via API
- MVVM Architecture - Clean and modular code structure
- AsyncImage - Efficiently loading remote images
- EnvironmentObject & StateObject - Managing shared data
 
# 🛠️ Implementation Details

## 1- API Integration
- Integrated Airtable API for fetching movies and directors.
- Used URLSession to make asynchronous GET requests.
- Decoded JSON responses into Swift structs using Codable.
## 2- Fetching & Displaying Data
- Created a NetworkManager to fetch:

## 3-  Movie Details Page
- Displays IMDb rating, runtime, language, and genre.
- Used SwiftUI's AsyncImage to efficiently load images.

## 🚀 How to Run the Project
 git clone https://github.com/yourusername/movie-app.git








