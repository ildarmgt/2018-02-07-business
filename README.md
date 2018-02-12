# 2018-02-07-business

to run, need ruby and sass
  
* in ./public/css run sass

  `sass --watch main.scss:main.css`
  
* for Sinatra and other gems run in project root directory:

  `bundle install`

* if you want email service on server to work, add api env variable like this:

  `echo "export SENDGRID_API_KEY='YOUR_API_KEY'" > sendgrid.env`
  
  `source ./sendgrid.env`

* in project root directory run server:
  
  `ruby app.rb`
  
* browse to (default) `http://localhost:4567/`in chrome/firefox
 
* logon is `jeremy` / `1234`
