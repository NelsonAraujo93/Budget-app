require 'rails_helper'

RSpec.describe Category, type: :system do
  let(:user) { User.new(name: 'Biruk', email: 'biruk@example.com', password: 'password') }
  subject do
    Category.new(author_id: user.id, icon: 'https://picsum.photos/200/300', name: 'Category 1')
  end

  before do
    ActionMailer::Base.deliveries.clear
    user.save
    subject.save
  end

  it 'show the Categories list' do
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

    visit users_path
    expect(page).to have_content('Add Category')
  end

  it 'Create a new Category' do
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

    visit users_path

    click_button 'Add Category'

    fill_in 'Category name', with: 'Cate from Capybara'
    fill_in 'Icon url', with: 'https://picsum.photos/200/300'
    click_button 'Save'

    expect(page).to have_content('Cate from Capybara')
  end
end
