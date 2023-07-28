#  MovieApp - SwiftUI

Requirement:
An app that will make queries to an online movie database service. 
1. The user can enter a search term (like "batman")
2. All matching results with that term in the movie title will be displayed.
3. Display the search results in any way. 
    - Can show the full movie title and movie overview/description, movie thumbnail. 

Use the free public movie database as documented here - https://www.themoviedb.org/documentation/api
Use the "search/movie" endpoint as documented here - https://developers.themoviedb.org/3/search/search-movies
More docs are available here - https://developers.themoviedb.org/3/getting-started/introduction


Things done:
1. Created the account on TMDB site to access the auth key and auth token.
2. Designed SwiftUI app fullfulling above all requirements.
3. Xcode Project Structure (MovieApp):
    - Source
        - App
        - Enums
        - Extensions
        - Models
        - Network
            - Services
        - ViewModels
        - Views
4. Followed MVVM architectural design pattern.


Steps to run the application:
1. App can be installed or excuted on device/simulator using xcode.
2. Auth token will be required.
    - Token must be set in `Endpoint.swift` -> `Auth` -> `token` -> <SET_AUTH_TOKEN> 
3. Run the application.
4. View will be presented with searchBar.
5. Enter the search text.
6. If data for the searchText is available then results will be shown.
7. If anything goes wrong (like connection issue, api/response error, no match available) then error
   message will be shown.

PS: Can refer the demo video put in the "Videos" folder.


