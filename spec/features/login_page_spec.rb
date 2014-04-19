require 'spec_helper'

describe 'The login page' do
  context 'with an invalid user' do
    before do
      visit 'users/login'
      fill_in 'Email', with: 'nobody@example.org'
      fill_in 'Password', with: 'notapassword'
      click_button 'Sign in'
    end
    it { expect(page).to have_content('Invalid email or password.')  }
  end
  context 'with a valid user' do
    before do
      @valid_user = create(:user, password: 'Password1', confirmed_at: 5.minutes.ago)
      visit 'users/login'
      fill_in 'Email', with: @valid_user.email
      fill_in 'Password', with: 'Password1'
      click_button 'Sign in'
    end
    it { expect(page).to have_content('Signed in successfully.')  }
  end
end