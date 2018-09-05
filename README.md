# Project - Web Programming with Ruby

Over the next week you will build an app to consolidate and expand on everything you have learned:

* Object oriented programming with Ruby
* Test Driven Development
* Web Programming (REST, MVC)
* Interacting with a PostgreSQL database (CRUD)

## Rules

The project must be built using only:

* HTML / CSS
* Ruby
* Sinatra
* PostgreSQL and the PG gem

It must **NOT** use:

* Any Object Relational Mapper (e.g. ActiveRecord)
* JavaScript. At all. Don't even think about it.
* Any pre-built CSS libraries, such as Bootstrap.
* Authentication. Assume that the user already has secure access to the app.

All of these will be covered later in the course. Do not make any attempt to use them this week, even if you've used them before.

Make lots of little (but sensible!) git commits. The number of commits in your final submission is one of the criteria your work will be judged on.

## Submission

Submit a link to your Github repo through the Homework Submission form as soon as the repo has been created.

Your code will be reviewed with an instructor on Thursday afternoon.

## Presentation

Presentations will be held on Friday. You will have 10 minutes to present your work, with 5 minutes for questions.

We expect you to:

* Show your sketches, notes, diagrams, wireframes and user planning
* Demonstrate your app's functionality
* Talk about some code that you are particularly proud of
* Highlight your main learning points

Do not:

* Talk through every single line of code
* Go over the time limit

## Asking for help

The instructional team will be on hand for technical assistance, but you are strongly encouraged to take this opportunity to practise self-sufficiency, as will be expected of you as a professional software developer.

Before asking an instructor for help this week, you should be ready to answer the following questions:

* What are you trying to achieve?
* What do you think the problem is?
* What have you tried so far?
* What did Google say about your error message?

## Attendance

The cohort will meet at the usual time every morning. Your attendance is recorded every day as normal.

## PDA Reminder

Remember to gather evidence for your PDA this week. This should only take 5 minutes:

* Go to your [PDA Checklist](https://github.com/codeclan/pda/blob/master/Student%20Checklist/Student%20Checklist.pdf)
* Submit your PDA evidence (screenshots, etc.) to your own PDA repo

### Gym Brief

A local gym has asked you to build a piece of software to help them to manage memberships, and register members for classes.

#### Inspired By

[Glofox](https://www.glofox.com/club-solution/), [Pike13](https://www.pike13.com/pike13-scheduling-software-demo)

#### Caution

You might try to create a Ruby class named `Class` - this is a reserved word in Ruby, so you will have to name your class `GymClass`, or similar.

### User Stories / Acceptance Criteria - MVP

#### Manage Membership

_As a gym manager_ <br />
_I want to manage the list of members_<br />
_So that I am storing up-to-date information about members_<br />

**Acceptance Criteria:** Gym managers should be able to create members<br />
**Acceptance Criteria:** Gym managers should be able to edit members<br />


#### Manage Classes

_As a gym manager_<br />
_I want to manage the list of classes_<br />
_So that I have up to date information about what classes are available_<br />

**Acceptance Criteria:** Gym managers should be able to create classes<br />
**Acceptance Criteria:** Gym managers should be able to delete classes<br /> 

#### Register Users for Classes

_As a gym manager_<br />
_I want to be able to add a user to a class_<br />
_So that I can book their place_<br />

**Acceptance Criteria:** Gym managers should be able to assign members to classes.

#### View all customers assigned to a class

_As a gym manager_<br />
_I want to view all members assigned to a class_<br />
_So that I can see which classes are going to be busy_<br />

**Acceptance Criteria:** Gym managers should be able to view a list of classes, and see the members that will be attending that class.

### User Stories - Possible Extensions

#### Classes should have a maximum capacity

_As a gym manager_<br />
_I want to be able to assign a maximum capacity to a class_<br />
_So that the class can't be over-booked_<br />

**Acceptance Criteria:** Gym managers should be able to give each class a maximum capacity<br />
**Acceptance Criteria:** Gym managers should not be able to assign members to a class that is already full. (At capacity)

#### Premium Membership

_As a gym manager_<br />
_I want to be able to mark members as having "Premium Membership"_<br />
_So that I can maximise revenue_<br />

**Acceptance Criteria:** Gym managers will be able to assign premium membership to members<br />
**ACceptance Criteria:** Gym managers will be able to assign a time to a class <br />
**Acceptance Criteria:** Gym managers will only be able to assign premium members to classes that take place during peak hours. (7-9am, 5-8pm)

