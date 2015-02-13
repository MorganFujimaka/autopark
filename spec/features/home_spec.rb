require 'spec_helper'

describe "Home Page", type: :feature do

  it "lists all products" do
    visit root_path

    expect(page).to have_content("Products:")
  end

  it "have Add product button for admins" do
    User.create(email: 'user@example.com', password: 'password', is_admin: true)
    visit root_path

    within('#signin_form') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Sign in'
    
    expect(page).to have_content('Add product')
  end

end