require "rails_helper"

describe "Visit new uer path" do
  context "guest sees fields to create account" do
    scenario "creates new account" do

      user = build(:user)

      visit new_user_path

      fill_in "First Name", with: user.first_name
      fill_in "Last Name", with: user.last_name
      fill_in "Street Address", with: user.street_number
      fill_in "Unit Number", with: "45"
      fill_in "City", with: user.city
      fill_in "State", with: user.state
      fill_in "Zip Code", with: user.zip_code
      fill_in "Email Address", with: user.email
      fill_in "Photo", with: user.photo
      select('Villager', from: 'role_id')

      click_on "Create Account!"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Hey #{user.first_name}")
    end
  end
end
