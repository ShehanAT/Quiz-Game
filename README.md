# Quiz Game Overview
This is a quiz taking application very similar to the popular quizzing application Kahoot! Most notable features include ability to add any quiz with or without supporting images, authentication system, ability to save high score and ability to share quiz results on social platforms such as Twitter.It is built using Ruby on Rails and developed following the Test Driven Development technique.

# Purpose:
This project was built in order to gain experience developing web applications through the Test-Driven Development technique. Throughout the course of development, over 40 integration and unit tests using Capybara, Selenium and RSpec were written. Overall, this project has over 95% test coverage so as to minimize bugs and errors. 

### Dependencies:
* Ruby 2.x
* Ruby on Rails 6.x

### Platform:
This web application can run on any modern browser such as Google Chrome, Firefox, Safari etc...

# Usage: 
### Steps for running locally:
1. Create env file 
2. Create Google Cloud Platform project
3. Get Gmail Account credential
4. Run project locally 

##### Create env file:
1. Go to ```{PROJECT_FOLDER}\config``` and create ```application.yml``` in it 

##### For Google Cloud Platform setup:
1. Go to [https://console.cloud.google.com/projectcreate](https://console.cloud.google.com/projectcreate)
2. Create project
3. In GCP Navigation Menu select "IAM & Admin" > "Service Accounts" 
4. Click on your recently created project at Project Selection screen 
5. Click "Create Service Account" in following screen
6. Fill in service account details and download JSON file 
6. Place JSON file OUTSIDE of project repo and copy it's path 
8. add this key/value pair: ```GCP_KEYFILE_PATH: "your\path\to\keyfile.json"``` to your ```{PROJECT_FOLDER}\config\application.yml``` file 

##### For Gmail Account credentials:
1. Add your Gmail account's email address and password to ```{PROJECT_FOLDER}\config\application.yml``` in the following format: 
```
GMAIL_USERNAME: "YOUR_EMAIL_ADDRESS"
GMAIL_PASSWORD: "EMAIL_PASSWORD"
``` 

##### For running project locally:
1. Clone project locally and unzip project folder 
2. Use a terminal application to ``cd`` into unzipped project folder 
3. Run command ```bundle install``` to install all dependencies 
4. Start development server via ```bin/rails server```
5. To access cloud image storage feature you must go to Google Cloud Platform and create a project(link: )

### Production site:
* https://fountain-of-quizzes.herokuapp.com/

# Screenshots: 
Welcome page:
![Welcome page](/public/screenshot_1.png)

Quiz Page:
![Quiz Page](/public/screenshot_2.png)

Quiz Questions Page:
![Quiz Questions Page](/public/screenshot_3.png)

# Contributing:
Please feel free to contribute to this project however possible by forking this repo, making changes and initiating pull requests. Thanks!
