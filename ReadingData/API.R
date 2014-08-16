# Creating an application
https://dev.twitter.com/apps

# Accessing Twitter from R
myapp = oauth_app("twitter",
                  key="yourConsumerKeyHere",secret="yourConsumerSecretHere")
sig = sign_oauth1.0(myapp,
                    token = "yourTokenHere",
                    token_secret = "yourTokenSecretHere")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

# Converting the json object
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]

# How to know the URL
https://dev.twitter.com/docs/api/1.1/get/search/tweets

# In general, look at the documentation
https://dev.twitter.com/docs/api/1.1/overview
