require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user) { User.new(name: 'Nelson', email: 'nels@nels.com', password: 'shinra') }

  before do
    ActionMailer::Base.deliveries.clear
  end

  # INDEX PAGE CAPYBARA
  describe 'Sign_up, sign_in and confirm email' do
    it 'show the recipes list' do
      visit new_user_registration_path

      # Fill in the sign-in form with valid user credentials
      fill_in 'Full name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      click_button 'Next'

      # Retrieve the confirmation email
      path_regex = %r{(?:"https?://.*?)(/.*?)(?:")}
      email = ActionMailer::Base.deliveries.last
      path = email.body.match(path_regex)[1]

      # Visit the confirmation link
      visit path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      expect(page).to have_current_path(users_path)
      # Assert that the user is redirected to a confirmation success message

      # Assert that the user is redirected to the root page
    end
  end
end
