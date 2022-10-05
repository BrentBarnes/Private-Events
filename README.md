
# Private Events

The goal of this project was to practice harder types of model associations.

### Assignment From The Odin Project

"You want to build a site similar to a private [Eventbrite](https://www.eventbrite.com/) which allows users to create events and then manage user signups."

### Functionality

* User can create events
* User can attend many events
* Event can be attended by many users
* User can view the events they've created
* User can view the events they're attending
* User can send and receive invitations
* Uses a has_many through association that allows us to gain access to a user's invitations and an invitation's invitees through a join table called attendances

### Screenshots

<p float = 'left' >
  <figure>
    <figcaption>Home Page (events#index)</figcaption>
    <img src="screenshots/home.png" alt="Home Page (events#index)" width="600" height="300">
  </figure>
  <figure>
    <figcaption>Event Page</figcaption>
    <img src="screenshots/event.png" alt="Event show page" width="600" height="300">
  </figure>
  <figure>
    <figcaption>Events You're Attending</figcaption>
    <img src="screenshots/attending.png" alt="Event's you're attending" width="600" height="300">
  </figure>
  <figure>
    <figcaption>Event's You're Hosting</figcaption>
    <img src="screenshots/hosting.png" alt="Events You're Hosting" width="600" height="300">
  </figure>
  <figure>
    <figcaption>User Model</figcaption>
    <img src="screenshots/user_model.png" alt="User Model" width="600" height="300">
  </figure>
  <figure>
    <figcaption>Event Model</figcaption>
    <img src="screenshots/event_model.png" alt="Event Model" width="600" height="300">
  </figure>
  <figure>
    <figcaption>Invitation Model</figcaption>
    <img src="screenshots/invitation_model.png" alt="Invitation Model" width="600" height="300">
  </figure>
  <figure>
    <figcaption>Attendance Model</figcaption>
    <img src="screenshots/attendance.png" alt="Attendance Model" width="600" height="300">
  </figure>
</p>