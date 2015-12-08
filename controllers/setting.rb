class SettingController < ApplicationController


  # id | account_id | marathon_name | marathon_date | skill_level


  get '/set_up' do
    authorization_check
    erb :set_up
  end

  post '/set_up' do
    provide_user_id
    @setting = Setting.new
    # @setting.account_id = THIS WILL BE AUTOMATIC?
    @setting.account_id = @user_id
    @setting.marathon_name = params[:marathon_name]
    @setting.marathon_date = params[:marathon_date]
    @setting.skill_level = params[:skill_level]
    @setting.save
    # @setting = Setting.all
    @user_name = session[:current_user].user_name

redirect '../tracker/dashboard'
  end


end
