class UserSession < Authlogic::Session::Base
  consecutive_failed_logins_limit 5
  failed_login_ban_for 15.minutes
  logout_on_timeout true
end
