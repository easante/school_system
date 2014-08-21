require 'spec_helper'

feature 'Creating the school term' do
  let!(:year) { Fabricate(:school_year) }

  scenario 'create school term object successfully' do
    visit root_path

    click_link 'Setup'
    click_link 'New School Term'

    fill_in 'Title', with: '2014-2015'
    fill_in 'Start date', with: '2014-09-01'
    fill_in 'End date', with: '2014-12-31'

    click_button 'Create School term'

    expect(page).to have_content('School term successfully created.')
  end

  scenario 'failure to create school term object' do
    visit root_path
#require 'pry';binding.pry
    click_link 'Setup'
    click_link 'New School Term'

    fill_in 'Title', with: ''
    fill_in 'Start date', with: '2014-09-01'
    fill_in 'End date', with: '2014-12-31'

    click_button 'Create School term'

    expect(page).to have_content('School term not successfully created.')
    expect(page).to have_content("can't be blank")

  end
end
