require "rails_helper"

describe "User can log out" do
  scenario "A logged in user can log out" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit root_path

    expect(page).to have_content("Log Out")

    click_on "Log Out"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Log In")
  end
end
