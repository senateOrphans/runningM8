class TrackerController < ApplicationController

require 'date'

  get '/dashboard' do

    provide_user_id
    @user_id
@current_marathon_name = Setting.find_by(account_id: @user_id).marathon_name
@current_unformatted_marathon_date = Setting.find_by(account_id: @user_id).marathon_date

@current_date = Date.today
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



@days_until = @trainingStart - @current_date
@days_until_formatted = @days_until.to_i

def give_training_week_number(argument)
  @inc = 1
  @training_week_number
if argument > 0
  @training_week_number = "Training hasn't started!"
elsif (-7 < argument && argument < 0) || argument == 0
  return @training_week_number = 1
  elsif
    until (-7 * @inc < argument && argument < -7 * (@inc-1)) || argument == -7 * (@inc-1) do
      @inc += 1
       @training_week_number = @inc
    end

    end
    end

give_training_week_number(@days_until_formatted)


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
