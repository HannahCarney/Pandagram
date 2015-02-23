require 'rails_helper'

context "user not signed in and on the homepage" do
  it "should see a 'sign in' link and a 'sign up' link" do
    visit('/')
    expect(page).to have_link('Log in')
    expect(page).to have_link('Sign up now!')
  end

  it "should not see 'sign out' link" do
    visit('/')
    expect(page).not_to have_link('Sign out')
  end
end

context "user signed in on the homepage" do

  before do
    visit('/')
    click_link('Sign up now!')
    fill_in('Username', with: 'Hannah')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  it "should see 'sign out' link" do
    visit('/')
    expect(page).to have_link('Sign out')
  end

  it "should not see a 'Log in'" do
    visit('/')
    expect(page).not_to have_link('Log in')
  end

  it "should be able to login with username" do
    visit('/')
    click_link('Sign out')
    click_link('Log in')
    fill_in('Login', with: 'Hannah')
    fill_in('Password', with: 'testtest')   
    click_button('Log in')
    expect(page).to have_content('Hannah')
  end

  it "should be able to login with email" do
    visit('/')
    click_link('Sign out')
    click_link('Log in')
    fill_in('Login', with: 'test@example.com')
    fill_in('Password', with: 'testtest')   
    click_button('Log in')
    expect(page).to have_content('Hannah')
  end
end