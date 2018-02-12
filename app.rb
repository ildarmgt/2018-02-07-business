require 'sinatra'
require 'sendgrid-ruby'
include SendGrid

get '/' do
    erb :index
end

get '/about' do
    erb :about
end

get '/contact' do
    erb :contact
end

get '/login' do
    if (params[:myusername] == 'jeremy') && (params[:mypassword] == '1234')
        redirect '/profile'
    else
        erb :login
    end
    erb :login
end

get '/profile' do
    erb :profile
end

get '/email' do
  # my stuff
  @return_email = params[:return_email]
  @subject = "[customer service]: " + params[:sender_name]
  @email_body = params[:email_body]

  from = Email.new(email: @return_email)
  to = Email.new(email: 'jeremyleitmeyer@gmail.com')
  subject = @subject
  content = Content.new(type: 'text/plain', value: @email_body)
  mail = Mail.new(from, subject, to, content)
  
  sg = SendGrid::API.new(api_key: ENV["SENDGRID_API_KEY"])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers

  if (response.status_code.to_s == "202") || (response.status_code.to_s == "200")
    @email_result = "email sent"
  elsif
    @email_result = "there was an error #" + response.status_code.to_s + " with your request"
  end

  erb :contact
end
