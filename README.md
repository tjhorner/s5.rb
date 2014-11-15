# StudentRND s5 Ruby Library

## Example usage

```ruby
# create a new S5 instance
app = S5.new("YOUR-TOKEN", "YOUR-SECRET")

# direct the user to this url
app.oauth_url("http://example.com/oauth/s5", true)

# returns a hash with the specified user's info, does not require access token
app.user("tjhorner")

# once you have the auth code from the user
access_token = app.request_access_token("AUTH-CODE")

# returns a hash with the user info
app.me(access_token)
```