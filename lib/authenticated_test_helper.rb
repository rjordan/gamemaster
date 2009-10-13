module AuthenticatedTestHelper


  # Sets the current user in the session from the user fixtures.
  def login_as(user)
    activate_authlogic
    UserSession.create(users(user))
  end

  def logout
    if(current_user)
      current_user.destroy
    end
  end

  def current_user
    UserSession.find
  end

  # Assert the block redirects to the login
  #
  #   assert_requires_login(:bob) { get :edit, :id => 1 }
  #
  #def assert_requires_login(user = nil, &block)
  #  login_as(user) if user
  #  block.call
  #  assert_redirected_to new_session_url
  #end
  def assert_requires_login(&block)
    logout
    block.call  #yield?
    assert_response :redirect
    assert_redirected_to new_session_url
  end

  # Assert the block accepts the login
  #
  #   assert_accepts_login(:bob) { get :edit, :id => 1 }
  #
  # Accepts anonymous logins:
  #
  #   assert_accepts_login { get :list }
  #
  def assert_accepts_login(user = nil, &block)
    login_as(user) if user
    block.call
    assert_response :success
  end
end