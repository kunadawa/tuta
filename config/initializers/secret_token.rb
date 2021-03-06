# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#Tuta::Application.config.secret_key_base = '50014e6fc26c7841295d754a9b96117f038eedc12a05dff40b4d37879f016e633ef69f074bcb649976b1b93f296df254497a415a68aedd5316df8fe7f6df0c88'
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		File.read(token_file).chomp
	else
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

Tuta::Application.config.secret_key_base = secure_token
