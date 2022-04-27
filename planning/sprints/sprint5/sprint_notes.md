# Sprint Meeting Notes

*note: replace anything surrounded by << >> and **remove** the << >>*

**Attended**: Destiny, Cole

**DATE**: 4/25/22

***

## Sprint 5 Review

### SRS Sections Updated

UI To Interact With User Profile

### User Story

- As a user, I want to be able to signup and create my own user profile
- As a user, I want to be able to view or update all of my profile data

### Sprint Requirements Attempted

Login and Signup pages

### Completed Requirements

- updated the login and register api endpoints; both endpoints now works with token authentication
- added new endpoints that allows for fetching and updating of existing user profile data

### Incomplete Requirements

- the api endpoints for fetching posts and storing newly posts

### The summary of the entire project

Social Media App where users can share their daily activities with friends and gain inspiration of places to travel to from others on their feed.

***

## Sprint 6 Planning

## Requirements Flex

4/5 requirement flexes remaining

## Technical Debt

- api endpoint for fetching posts and storing newly created posts

### Requirement Target

Interactive Map, Permanent storage of post data

### User Stories

- As a user, I want an map view where I can view different activities/events going on within my proximity
- As a user, I want to be able to save my posts

### Planning

- need to construct a post data model
- need to create the following api endpoints
  - account/posts
    - GET: returns a list of all posts created by all users
    - POST: saves each post created by the user
- wire up the frontend guis to access these endpoints

### Action Items

- finish the incomplete requirements from last week
- start working on the ui for the interactive map feature

### Issues and Risks

- If not all post data is stored, then it affects us rendering the data we need for the map
- The location displayed may provide harmful information about user to those with malicous intent 

### Team Work Assignments

- Cole: responsible for creating the api endpoints needed for storing new posts and fetching posts
- Destiny and Liz: resposible for the ui for the map
