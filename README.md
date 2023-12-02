# shelter-swipe

Match with shelter animals to find your new best friend!

ShelterSwipe is an application where you can swipe through pets available for adoption at local shelters. We hope to match every potential pet-owner with their perfect animal to foster loving relationships and decrease the number of shelter animals.


<img src="https://github.com/ronaldleung1/shelter-swipe/blob/main/LoginScreen.png?raw=true" width="150" /> <img src="https://github.com/ronaldleung1/shelter-swipe/blob/main/GoogleSignIn.png?raw=true" width="150" />
<img src="https://github.com/ronaldleung1/shelter-swipe/blob/main/CardView.png?raw=true" width="150" /> <img src="https://github.com/ronaldleung1/shelter-swipe/blob/main/SaveView.png?raw=true" width="150" />
<img src="https://github.com/ronaldleung1/shelter-swipe/blob/main/ProfileView.png?raw=true" width="150" />

### Frontend requirements
- The user interface contains three different screens: the login page; the home page, where users may swipe right and left to like or dislike a pet; and the profile page, a scrollable view that contains all of the pets a user has liked. It is integrated to receive data from and write to the backend database.
### Backend requirements
- The database contains three models: users, pets, and shelters. Users and pets are connected by a many-to-many relationship that represents liking or disliking an animal. A shelter has a one-to-many relationship with pets. GET, POST, and DELETE routes implement the app's API functionality.
