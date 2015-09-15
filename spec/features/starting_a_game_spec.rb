require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end

  scenario 'I can input my name' do
    visit '/name'
    fill_in 'name', with: 'Ken'
    click_on 'Submit'
    expect(current_url).to have_content('?name=Ken')
  end

  xscenario 'name is a required input' do
    visit '/name'
    click_on 'Submit'
    expect(current_url).to_not have_content('?name=')
  end
end
