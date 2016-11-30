require 'spec_helper'
require 'web_helper'

feature "Sign_up_form", feature: :type do
  scenario "Sign up to bookmark manager" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, hello@example.com')
    expect(User.first.email).to eq('hello@example.com')
  end
end
