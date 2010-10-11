# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_GroupApp_session',
  :secret      => '00c15b29eed9c69f0fd9c875d3a1d807674c919fd7accceabcea5b5a3ed9d62e1da742584dab1fd965e8c643ccf61db70f4b4b1932707eca8738906d15fa7886'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
