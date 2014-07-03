require 'spec_helper'

describe 'The home page', type: :feature do
  context 'when a user is not logged in' do
    before do
      visit '/'
    end
    it { expect(page).to have_link('Login', href: '/users/login') }
    it { expect(page).to have_link('Signup', href: '/users/register') }
  end
end