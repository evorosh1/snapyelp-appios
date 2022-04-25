# Sprint Meeting Notes

*note: replace anything surrounded by << >> and **remove** the << >>*

**Attended**: Destiny, Cole

**DATE**: 4/25/22

***

## Sprint 5 Review

### SRS Sections Updated

Requirements > Profile GUI

### User Story

- As a user, I want to be able to signup and create my own user profile
- As a user, I want to be able to view or update all of my profile data

### Sprint Requirements Attempted

Requirements > Login and Signup pages

### Completed Requirements

- updated the login and register api endpoints; both endpoints now works with token authentication
- added new endpoints that allows for fetching and updating of existing user profile data

### Incomplete Requirements

- api endpoint for fetching and posting posts

### The summary of the entire project

Social Media App where users can share their daily activities with friends and gain inspiration of places to travel to from others on their feed.

***

## Sprint 6 Planning

## Requirements Flex

4/5 requirement flexes remaining

## Technical Debt

- api endpoint for fetching posts and creating posts

### Requirement Target

Deleting Posts, Location

### User Stories

- As a user, I want to be able to able to delete my account
- As a user, I want to be able to able to add a location to my posts

### Planning

- need to construct a post data model
- need to create the following api endpoints
  - account/posts
    - GET: returns a list of all posts created by all users
    - POST: saves each post created by the user
- wire up the frontend guis to access these endpoints

### Action Items

- we need to finish the requirements from last week 

### Issues and Risks

- If not all data is deleted when a user tries to delete their account
- The location displayed may provide harmful information about user to those with malicous intent 

### Team Work Assignments

<< A list of each team member and their works assignments for this sprint >>
