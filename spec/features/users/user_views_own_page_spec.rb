require "rails_helper"

feature "a user views own user page", %q(

As a registered user
I want to view my user page
So that I can see my personal details

Acceptance Criteria
[ ] I must be able to reach my user page from anywhere within the app
[ ] I must see my name (email address)

) do

  def sign_in_as(user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
  end

  scenario "a user views own user page", focus: true do

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    expect(page).to have_content user.email
    click_link user.email

    expect(page).to have_content "Username: #{user.email}"

  end

end
