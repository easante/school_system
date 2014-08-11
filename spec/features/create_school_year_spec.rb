require 'spec_helper'

feature 'Creating the school year' do
  scenario 'create school year object successfully' do
    visit root_path

    click_link 'Setup'
    click_link 'New School Year'

    fill_in 'Title', with: '2014-2015'
    fill_in 'Start date', with: '2014-09-01'
    fill_in 'End date', with: '2014-12-31'

    click_button 'Create School year'

    expect(page).to have_content('School year successfully created.')
  end

  scenario 'failure to create school year object' do
    visit root_path

    click_link 'Setup'
    click_link 'New School Year'

    fill_in 'Title', with: ''
    fill_in 'Start date', with: '2014-09-01'
    fill_in 'End date', with: '2014-12-31'

    click_button 'Create School year'

    expect(page).to have_content('School year not successfully created.')
    expect(page).to have_content("can't be blank")

  end
end
