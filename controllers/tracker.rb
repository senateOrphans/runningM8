class TrackerController < ApplicationController

  get '/dashboard' do

    provide_user_id
    @user_id
@current_marathon_name = Setting.find_by(account_id: @user_id).marathon_name
@current_unformatted_marathon_date = Setting.find_by(account_id: @user_id).marathon_date

@current_date = Time.now
@current_week = @current_date.strftime("%W")


def format_date(date)
   @fixed_date = date.gsub('-',',')
 @new_array = @fixed_date.split(',')
@current_formatted_marathon_date = DateTime.new(@new_array[0].to_i, @new_array[1].to_i, @new_array[2].to_i)
end
format_date(@current_unformatted_marathon_date)

@trainingStart = @current_formatted_marathon_date - 125
@week_one = @trainingStart.strftime("%W")

def how_many_weeks_away
if @week_one.to_i - @current_week.to_i < 0
  return @weeks_away = -1 * (@week_one.to_i - @current_week.to_i)
elsif @week_one.to_i - @current_week.to_i > 0
  return @weeks_away = @week_one.to_i - @current_week.to_i
else
  return @weeks_away = 'Zero'
end
end
how_many_weeks_away

    @novice = Hash.new
    @novice[1] = ['Rest', '3 miles', '3 miles', '3 miles', 'Rest', '6', 'Cross']
    erb :dashboard

  end



  post '/dashboard' do
    provide_user_id
    @current_marathon_settings_id = Setting.find_by(account_id: @user_id).id

    @tracker = Tracker.new
@tracker.settings_id = @current_marathon_settings_id
@tracker.week = '21'
@tracker.distance_mon = params[:distance_mon]
@tracker.distance_tues = params[:distance_tues]
@tracker.distance_wed = params[:distance_wed]
@tracker.distance_thurs = params[:distance_thurs]
@tracker.distance_fri = params[:distance_fri]
@tracker.distance_sat = params[:distance_sat]
@tracker.distance_sun = params[:distance_sun]
@tracker.save



  redirect '/tracker/dashboard'
  end



end
