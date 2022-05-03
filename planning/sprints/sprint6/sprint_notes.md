# Sprint Meeting Notes

*note: replace anything surrounded by << >> and **remove** the << >>*

**Attended**: Destiny, Liz

**DATE**: 5/02/22

***

## Sprint 6 Review

### SRS Sections Updated

Known Bugs

### User Story

- As a user, I want an map view where I can view different activities/events going on within my proximity

### Sprint Requirements Attempted

Interactive Map UI

### Completed Requirements

Interactive Map UI

### Incomplete Requirements

- the api endpoints for fetching posts and storing newly posts

### The summary of the entire project

Social Media App where users can share their daily activities with friends and gain inspiration of places to travel to from others on their feed.


***

## Sprint 7 Planning

## Requirements Flex

5/5

## Technical Debt

- api endpoint for fetching posts and storing newly created posts

### Requirement Target

- View posts from interactive map, Permanent storage of post data

### User Stories

- As a user, I want an map view where I can view different activities/events going on within my proximity

### Planning

- need to configure posts onto map

- need to construct a post data model
- need to create the following api endpoints
  - account/posts
    - GET: returns a list of all posts created by all users
    - POST: saves each post created by the user
- wire up the frontend guis to access these endpoints

### Action Items

- implement posts into the interactive map feature

### Issues and Risks

- The location displayed may provide harmful information about user to those with malicous intent 

### Team Work Assignments

- Cole: responsible for creating the api endpoints needed for storing new posts and fetching posts
- Destiny and Liz: resposible for the adding posts to map ui
