# Sprint Meeting Notes

*note: replace anything surrounded by << >> and **remove** the << >>*

**Attended**: Destiny, Liz

**DATE**: 4/11/22

***

## Sprint 4 Review

### SRS Sections Updated

- Requirements > Newsfeed GUI, Form for creating new post, Profile Page

### User Story

- As a user, I want to be able to signup and create my own username/user profile.

### Sprint Requirements Attempted

- Requirements > Login and Signup Pages Section

### Completed Requirements

- Created api endpoints for user login and registration
- Hooked up the frontend login and signup guis to access to the api and submit post requests 

### Incomplete Requirements

<< The work that has not been completed in this sprint. Be VERY detailed and specific regarding what isn't working and what needs to be completed >>

### The summary of the entire project

Social Media App where users can share their daily activities with friends and gain inspiration of places to travel to from others on their feed.

***

## Sprint 5 Planning

## Requirements Flex

5/5 requirement flexes remaining

## Technical Debt

<< Any requirements from the previous sprint that are using a technical flex >>

### Requirement Target

- Newsfeed GUI, Form for creating new post, Profile Page

### User Stories

- As a user, I want to be able to create posts for my newsfeed
- As a user, I want to be able to view just my posts on my profile page
- As a user, I want to be able to view posts from other users on my newsfeed
- As a user, I want to express my thoughts on a post by adding a comment
- As a user, I want a option to delete a post I’ve created

### Planning

<< Our team's detailed plan to complete the sprint >>

- need to construct a post data model
- need to create the following api endpoints
  - newsfeed
    - GET: returns a list of all posts created all users
  - profile
    - GET: returns a list of all posts created by the user
    - POST: saves each post created by the user
- wire up the frontend guis to access these endpoints

### Action Items

- the post data model needs to have a many-to-one relationship with the user data model

### Issues and Risks

- A user could accidently delete their posts

### Team Work Assignments

- Liz - 
- Destiny - 
- Cole - continue to work on backend
