class S5
	require 'cgi'
	require 'rest_client'
	require 'json'

	@@s5_base = "https://s5.studentrnd.org"
	@@api_base = @@s5_base + "/api/"

	def initialize(token, secret)
		@token = token
		@secret = secret
	end

	def oauth_url(callback, extended = false)
		extended = extended ? "&scope=extended" : ""
		return @@s5_base + "/oauth/" + @token + "?return=" + CGI.escape(callback) + extended
	end

	# will return nil on fail
	def get(path, params = {})
		params[:secret] = @secret
		begin
			return RestClient.get(@@api_base + path, {:params => params})
		rescue
			return nil
		end
	end

	# get access code from successful authorization
	def request_access_token(code)
		return get("oauth/exchange", {:code => code})
	end

	# get a user
	def user(username)
		res = get("user", {:username => username})
		res = res.is_a?(String) ? JSON.parse(res) : nil
		return res
	end

	# get user w/ access token
	def me(access_token)
		res = get("user/me", {:access_token => access_token})
		res = res.is_a?(String) ? JSON.parse(res) : nil
		return res
	end
end