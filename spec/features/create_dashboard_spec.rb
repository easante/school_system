require 'spec_helper'

feature 'Creating the dashboard for the application' do
  scenario 'create the home page of the application' do
    visit root_path

    expect(page).to have_content('Home')
  end
end
