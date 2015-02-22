# StudentRND s5 Ruby Library

## Example usage

```ruby
require 's5'

# Create an s5 instance with your API credentials
sso = S5.new("YOUR-TOKEN", "YOUR-SECRET")

# Get the OAuth URI with extended privileges
sso.get_oauth_uri("http://example.com/oauth/s5", "extended")

# Exchange the provided code for an access token
sso.exchange_code("AUTH-CODE")

# Get a user
sso.get_user("tjhorner")

# Get user from access token
sso.me(access_token)
```
