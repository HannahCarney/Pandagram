require 'rails_helper'



feature 'photos' do
  context 'no restaurants have been added' do

    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    scenario 'should display a prompt to add a photo' do
      visit '/home'
      expect(page).to have_content 'No photo'
      expect(page).to have_link 'Add a photo'
    end
  end
end