require 'spec_helper'

feature 'Chimpy Admin', :js do
  stub_authorization!

  given(:user) { create(:user) }

  background do
    visit spree.admin_path
  end

  scenario 'new user subscription with subscription checked' do
    click_link 'Users'
    click_link 'New User'

    fill_in_subscription user

    check 'user_subscribed'
    click_button 'Create'

    expect(current_path).to eq spree.edit_admin_user_path(Spree::User.last)
    expect(page).to have_text 'API Access'
    expect(page).to have_text 'No key'

    find_button('Generate API key').click

    fill_in_subscription user

    check 'user_subscribed'
    click_button 'Update'

    expect(Spree::User.last.subscribed).to be_truthy
  end

  scenario 'new user subscription with subscription un-checked' do
    click_link 'Users'
    click_link 'New User'

    fill_in_subscription user

    click_button 'Create'

    expect(current_path).to eq spree.edit_admin_user_path(Spree::User.last)
    expect(page).to have_text 'API Access'
    expect(page).to have_text 'No key'

    find_button('Generate API key').click

    fill_in_subscription user

    click_button 'Update'

    expect(Spree::User.last.subscribed).to be_falsey
  end

  private

  def fill_in_subscription(user)
    expect(page).to have_selector 'input#user_subscribed'

    fill_in 'user_email', with: "new-#{user.email}"
    fill_in 'user_password', with: 'test123456'
    fill_in 'user_password_confirmation', with: 'test123456'
  end
end
