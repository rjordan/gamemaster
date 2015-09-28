# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
if Rails.env.production?
  GameMaster::Application.config.secret_key_base = ENV.fetch('SECRET_KEY_BASE')
else
  GameMaster::Application.config.secret_key_base = '88f2d31d7173d71598bc7545c562333ed7aeca36909947e1a7e1db3e9024972720d241162f2b76eb2fbaebcd31001f14aa2446459ce843aed06c382105f976af'
end
