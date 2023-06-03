require 'rails_helper'

RSpec.describe Proceeding, type: :system do
  let(:user) { User.new(name: 'Nelson', email: 'nels@nels.com', password: 'shinra') }
  let(:category) do
    Category.new(author_id: user.id, icon: 'https://picsum.photos/200/300', name: 'Recipe 1')
  end
  subject { Proceeding.new(name:'Car stuff', author_id: user.id, amount: 15, categories: []) }
  before do
  ActionMailer::Base.deliveries.clear
    user.save
    category.save
    subject.categories << category
    subject.save
  end

  it 'show the Transactions list' do
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

    visit category_path(category.id)
    expect(page).to have_content('Add Transaction')
  end

  it 'Create a new Transaction' do
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

    visit category_path(category.id)

    click_button 'Add Transaction'
    fill_in 'Transaction name', with: 'Transaction from Capybara'
    fill_in 'Amount (numeric)', with: 40
    click_button 'Save'

    expect(page).to have_content('Transaction from Capybara')
  end
end
