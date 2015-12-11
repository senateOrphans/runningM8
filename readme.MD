# Welcome to Running M8!

[Running M8](http://104.236.214.136/) is a new app to help you train for a marathon. Whether you are a first-timer or a seasoned runner, Running M8 will guide you every step until the finish line.

![Screenshot of Running M8 Dashboard](http://i.imgur.com/rAYgymm.png)

## Approach Taken
Together, we brainstormed an app that would interest the both of us. Once we settled on the idea of a marathon training app, we began to wireframe our product. We considered both the log-in functionality and the actual dashboard that each user would interact with.

Once that was settled, Stephen began work on the back-end and Aaron began pre-work for the design. Once the basic functionality was in place, Aaron ramped up his work on the style of the app.

From that point on, we juggled back and forth, fixing problems as they arose and adding new features.

## User Stories
 * As a first time marathon runner, I am looking for an easy-to-use application that will tell me week-by-week how far I should be running and provides a level of accountability by asking me to log my progress.
 * As an intermediate marathon runner, I am looking for an app that can help me track additional metrics of my training plan -- and offer bragging rights about how much I am running!

## Running M8 Technology
 * **HTML5:** Creating forms
 * **Javascript and jQuery:** Displaying animation
 * **SASS and CSS:** Styling the pages
 * **Sinatra:** Building our web server
 * **Postgres:** Creating our databases
 * **Ruby:** Rendering views, setting page logic

## Installation Instructions
1. Clone the git repository.
2. Launch Postgres, open PSQL, copy and paste the migrations.sql file.
3. Navigate into the runningM8 folder you have cloned.
4. Enter the following commands:
  * bundle
  * bundle exec rackup
5. Open your browser of choice and visit localhost:9292

## Unsolved Problems / Future Features
 * The system allows registration of the same username with different capitalization.
 * Currently, the application only recognizes one setting for a marathon training plan. If the user wanted to use this application year after year, it does not yet have this functionality.
 * When a user attempts to logs-in with the wrong information, the button breaks for them to change their minds and register a new account. Similarly, if they are registering and receive an error that the username already exists, the button breaks for them to go log-in instead.
 * Password recovery
 * Take data from Active.com to auto-fill marathon information
 * Provide charts using chart.js
 * Additional metrics (average mileage per week, pace, etc.)
   * Scoring metrics (i.e. Are they completing 100% of each week's recommended training? How are they doing overall?)
 * Additional views (total, month-by-month, etc.)
 * Social features (compare with other users' training progress, display a leaderboard, etc.)
 * Alternate the color of each row on the training plan that is displayed on the countdown page

## Credits
We used [Hal Higdon's](http://www.halhigdon.com/training/51135/Marathon-Training-Guide) Novice 1 and Intermediate 1 training plans for our recommended plans.
