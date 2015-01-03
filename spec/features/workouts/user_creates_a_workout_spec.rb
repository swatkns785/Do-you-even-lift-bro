require "rails_helper"

feature "a user creates a workout", %q(

As a registered user
I want to add a workout to my page
So that I can add exercises to the workout and keep track of my progress

Acceptance Criteria
[x] I must be able to add a workout from anywhere in the app.
[x] I must be able enter the title and the date of the workout.
[ ] If I select a day that has yet to occur, I am presented with errors.
[ ] I must be able to optionally set the duration of my workout
[ ] If I make errors, I am presented with the appropriate error messages.
[x] If I fill out all of the forms correctly, I am redirected to a list of workouts

) do

  def sign_in_as(user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
  end

  scenario "a user creates adds a workout session" do

    workout = FactoryGirl.create(:workout)

    sign_in_as(workout.user)
    expect(page).to have_content workout.user.email

    click_link "Add a Workout"

    expect(page).to have_content "Fill out the form to initialize a workout session."

    fill_in "Title", with: workout.title
    select(workout.date.year, from: "workout[date(1i)]")
    select(1, from: "workout[date(2i)]")
    select(workout.date.day, from: "workout[date(3i)]")
    click_button "Submit"

    expect(page).to have_content "Your workout session has been successfully created."
    expect(page).to have_content workout.title
    expect(page).to have_content workout.date
    expect(page).to have_content workout.user.email

  end

  scenario "user leaves all fields empty", focus: true do

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit new_workout_path

    click_button "Submit"
    expect(page).to have_content "Title can't be blank"

  end

end
