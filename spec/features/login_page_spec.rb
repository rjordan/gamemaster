require 'rails_helper'

describe 'The login page', type: :feature do
  context 'with an invalid user' do
    before do
      visit '/users/login'
      fill_in 'Email', with: 'nobody@example.org'
      fill_in 'Password', with: 'notapassword'
      click_button 'Log in'
    end
    it { expect(page).to have_content('Invalid email or password.') }
  end
  context 'with a valid user' do
    before do
      @valid_user = FactoryGirl.create(:user, password: 'Password1')
      visit '/users/login'
      fill_in 'Email', with: @valid_user.email
      fill_in 'Password', with: 'Password1'
      click_button 'Log in'
    end
    it { expect(page).to have_content('Signed in successfully.') }
  end
end
