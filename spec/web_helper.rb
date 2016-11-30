def sign_up
  visit '/'
  expect(page.status.code).to eq(200)
  fill_in("Email", with: "hello@example.com")
  fill_in("Password", with: "password")
  click_button("Sign up")
end
