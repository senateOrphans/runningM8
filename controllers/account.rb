class AccountController < ApplicationController

get '/' do
  erb :index
end

#Add in welcome/login, not authorized, etc.

  get '/register' do
    erb :register
  end

  post '/register' do
    if does_user_exist(params[:user_name]) == true
      @taken = 'Sorry, that username has already been taken.'
      return erb :register
    end

        current_date = Time.new
        user = Account.create(user_name: params[:user_name], user_email: params[:user_email], password: params[:password], join_date: current_date)
        session[:current_user] = user
        redirect '/setting/set_up'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    if does_user_exist(params[:user_name]) == false
      @message = 'Your password or username is incorrect.'
      return erb :login
    else
      user = Account.authenticate(params[:user_name], params[:password])
      if user #Remember, if the authenticate does not match the password, it will return nil.
        session[:current_user] = user
        redirect '/tracker/dashboard'
      else
        @message = 'Your password or username is incorrect.'
        erb :login
      end
    end


  end

  get '/logout' do
    authorization_check
    session[:current_user] = nil
    erb :logged_out
  end

end
