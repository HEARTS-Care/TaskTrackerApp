# TaskTrackerApp
##Task Tracker App Development Instructions
##Repository Setup:  
You will be added as a collaborator to this repository.  
Once added, create a branch with your name (e.g., if your name is Kibru, name the branch kibru).  
Store your project files in a folder named after yourself within the repository (e.g., if your name is Kibru, create a folder named kibru and place all your code inside it).
###Workflow:  
Develop the task tracker app as per the provided requirements (see task description below).  
Commit your changes regularly to your branch with clear and descriptive commit messages.  
After completing the task, submit a pull request (PR) from your branch (e.g., kibru) to the main branch for review.
Project Structure:  
Example: If your name is Kibru, your folder structure should look like this:  
/kibru
  ├── lib
  ├── pubspec.yaml
  └── (other project files)
Task Description:
Develop a simple task tracker app in Flutter with the following features:  
###Pages:  
Onboarding screen.  
Signup/Login screen.  
Profile page (with edit functionality).  
Main page (task tracker).
###Tech Stack:  
Use Provider for task tracking logic (e.g., adding, updating, deleting tasks).  
Use GetX for navigation, authentication, and profile editing.  
Use GetStorage to persist login state and user profile data (e.g., updated username persists after app restart).  
Follow Clean Architecture principles for a modular and maintainable codebase.
###Theme Management:  
Implement proper theme management using Flutter’s built-in ThemeData.  
Support both light and dark themes.  
Provide a mechanism to toggle between themes (e.g., a button or setting in the profile page).  
Ensure consistent styling (colors, fonts, etc.) across all pages.
##Models:  
User: Fields like username, email, etc.  
Task: Fields like title, description, status (e.g., completed, inprogress, incomplete).
###Backend:  
Use mock backend services with local storage (via GetStorage) and local objects for all data operations.
###Submission:  
Ensure your code is well-documented, functional, and adheres to the requirements before creating the pull request.  
Notify the repository owner once your PR is submitted.
###Bonus (Optional):
Add localization support to the app:  
Implement localization for two languages: English and Amharic.  
Use Flutter’s internationalization features (e.g., intl package) to manage translations.  
Add a language change functionality (e.g., a dropdown or button in the profile page) to switch between English and Amharic.  
Ensure all static text (e.g., labels, buttons, onboarding content) is localized and updates dynamically when the language is changed.
