require 'spec_helper'

  feature "Sign in", type: :feature do
    scenario "I want to be able to sign in" do
      sign_up
      visit '/sign_in'
      expect(page.status_code).to eq 200
      fill_in("email", with: "user@email.com")
      fill_in("password", with: "password")
      click_button("Sign in")
      expect(page).to have_content("Welcome user@email.com")
  end
end
