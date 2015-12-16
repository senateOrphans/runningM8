class TrackerController < ApplicationController

require 'date'

  get '/dashboard' do

    provide_user_id
    provide_user_name
    @user_name
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

def tracker_total_distance
provide_user_id
@current_marathon_settings_id = Setting.find_by(account_id: @user_id).id
select_tracker = Tracker.find_by(settings_id: @current_marathon_settings_id)
if select_tracker
@total_distance = select_tracker.distance_mon.to_i + select_tracker.distance_tues.to_i + select_tracker.distance_wed.to_i + select_tracker.distance_thurs.to_i + select_tracker.distance_fri.to_i + select_tracker.distance_sat.to_i + select_tracker.distance_sun.to_i
return @total_distance
else
  return @total_distance = 0
end
end
tracker_total_distance

    @novice = Hash.new
    @novice[1] = ['Rest', '3 miles', '3 miles', '3 miles', 'Rest', '6 miles', 'Cross']
    @novice[2] = ['Rest', '3 miles', '3 miles', '3 miles', 'Rest', '7 miles', 'Cross']
    @novice[3] = ['Rest', '3 miles', '4 miles', '3 miles', 'Rest', '5 miles', 'Cross']
    @novice[4] = ['Rest', '3 miles', '4 miles', '3 miles', 'Rest', '9 miles', 'Cross']
    @novice[5] = ['Rest', '3 miles', '5 miles', '3 miles', 'Rest', '10 miles', 'Cross']
    @novice[6] = ['Rest', '3 miles', '5 miles', '3 miles', 'Rest', '7 miles', 'Cross']
    @novice[7] = ['Rest', '3 miles', '6 miles', '3 miles', 'Rest', '12 miles', 'Cross']
    @novice[8] = ['Rest', '3 miles', '6 miles', '3 miles', 'Rest', '13 miles', 'Cross']
    @novice[9] = ['Rest', '3 miles', '7 miles', '4 miles', 'Rest', '10 miles', 'Cross']
    @novice[10] = ['Rest', '3 miles', '7 miles', '4 miles', 'Rest', '15 miles', 'Cross']
    @novice[11] = ['Rest', '4 miles', '8 miles', '4 miles', 'Rest', '16 miles', 'Cross']
    @novice[12] = ['Rest', '4 miles', '8 miles', '5 miles', 'Rest', '12 miles', 'Cross']
    @novice[13] = ['Rest', '4 miles', '9 miles', '5 miles', 'Rest', '18 miles', 'Cross']
    @novice[14] = ['Rest', '5 miles', '9 miles', '5 miles', 'Rest', '14 miles', 'Cross']
    @novice[15] = ['Rest', '5 miles', '10 miles', '5 miles', 'Rest', '20 miles', 'Cross']
    @novice[16] = ['Rest', '5 miles', '8 miles', '4 miles', 'Rest', '12 miles', 'Cross']
    @novice[17] = ['Rest', '4 miles', '6 miles', '3 miles', 'Rest', '8 miles', 'Cross']
    @novice[18] = ['Rest', '3 miles', '4 miles', '2 miles', 'Rest', '26 miles', 'Cross']
    erb :dashboard

  end
  # ^ end of get dashboard?



  post '/dashboard' do
    provide_user_id
    @current_marathon_settings_id = Setting.find_by(account_id: @user_id).id



    @tracker = Tracker.new
@tracker.settings_id = @current_marathon_settings_id
@tracker.week = params[:week]
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
