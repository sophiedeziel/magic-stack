# frozen_string_literal: true

Given('I visit the home page') do
  visit root_path
end

Then('I should see {string}') do |text|
  expect(page).to have_content(text)
end

Then('the page should be successful') do
  expect(page.status_code).to eq(200)
end

Then('I should see the React application loaded') do
  expect(page).to have_css('div[id*="react-component"]', wait: 10)
end
