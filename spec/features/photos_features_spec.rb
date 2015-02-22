require 'rails_helper'

feature 'photos' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/home'
      expect(page).to have_content 'No photo'
      expect(page).to have_link 'Add a photo'
    end
  end
end