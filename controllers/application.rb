class ApplicationController < Sinatra::Base
  require 'bundler'
  Bundler.require

  ActiveRecord::Base.establish_connection(
    :database => 'running',
    :adapter => 'postgresql'
  )

  set :views, File.expand_path('../../views', __FILE__)
  set :public, File.expand_path('../../public', __FILE__)

  not_found do
   erb :not_found
  end

  enable :sessions

  # CHECK IF USERNAME ALREADY EXISTS
  def does_user_exist(username)
    user = Account.find_by(:user_name => username)
     #Note to self -- this is not searching params, this searching the database for the :user_name column
    if user #does it exist?
      return true
    else
      return false
    end
  end

  # AUTHORIZATION CHECK - FOR ALL PROTECTED PAGES
  def authorization_check
    if session[:current_user] == nil
      redirect '/'
    else
      return true
    end
  end

  # PROVIDE USER ID
  def provide_user_id
    user_id = session[:current_user]
return @user_id = user_id.id
  end

  def provide_user_name
    user_name = session[:current_user]
return @user_name = user_name.user_name
  end

end
