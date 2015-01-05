# require "rails_helper"
#
# feature "a user adds an exercise", %q(
#
# As a registered user
# I want to add exercises to a workout
# So that I add the details of a given workout
#
# Acceptance Criteria
# [ ] I must be able to add an exercise from the show workout page
# [ ] I must be allowed to specify the amount of reps of a given exercise
# [ ] If I fill out the form correctly, I must be redirected to the workout show page and the added  exercise must be displayed
# [ ] If I do not fill out the forms correctly, I am presented with the appropriate errors
# [ ] I should not be able to add a exercise to someone else's workout
#
# ) do
#
#   def sign_in_as(user)
#     visit new_user_session_path
#     fill_in "Email", with: user.email
#     fill_in "Password", with: user.password
#     click_on "Log in"
#   end
#
#   scenario "user successfully adds an exercise to a workout" do
#
#     exercise = FactoryGirl.create(:exercise)
#
#     sign_in_as(exercise.user)
#
#     visit workout_path(exercise.workout)
#
#     fill_in "Name", with: exercise.name
#     select exercise.reps, from: "Repetitions"
#     click_button "Add Exercise"
#
#     expect(page).to have_content "Exercise added."
#     expect(page).to have_content exercise.name
#     expect(page).to have_content exercise.reps
#
#   end
#
# end
