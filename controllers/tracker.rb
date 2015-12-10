class TrackerController < ApplicationController

require 'date'

# This method creates the hash for the novice training plan.
def create_novice
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
end

def create_intermediate
  @intermediate = Hash.new
  @intermediate[1] = ['Cross', '3 miles', '5 miles', '3 miles', 'Rest', '5 miles', '8 miles']
  @intermediate[2] = ['Cross', '3 miles', '5 miles', '3 miles', 'Rest', '5 miles', '9 miles']
  @intermediate[3] = ['Cross', '3 miles', '5 miles', '3 miles', 'Rest', '5 miles', '6 miles']
  @intermediate[4] = ['Cross', '3 miles', '6 miles', '3 miles', 'Rest', '6 miles', '11 miles']
  @intermediate[5] = ['Cross', '3 miles', '6 miles', '3 miles', 'Rest', '6 miles', '12 miles']
  @intermediate[6] = ['Cross', '3 miles', '5 miles', '3 miles', 'Rest', '6 miles', '9 miles']
  @intermediate[7] = ['Cross', '4 miles', '7 miles', '4 miles', 'Rest', '7 miles', '14 miles']
  @intermediate[8] = ['Cross', '4 miles', '7 miles', '4 miles', 'Rest', '7 miles', '15 miles']
  @intermediate[9] = ['Cross', '4 miles', '5 miles', '4 miles', 'Rest', 'Rest', '13 miles']
  @intermediate[10] = ['Cross', '4 miles', '8 miles', '4 miles', 'Rest', '8 miles', '17 miles']
  @intermediate[11] = ['Cross', '5 miles', '8 miles', '5 miles', 'Rest', '8 miles', '18 miles']
  @intermediate[12] = ['Cross', '5 miles', '5 miles', '5 miles', 'Rest', '8 miles', '13 miles']
  @intermediate[13] = ['Cross', '5 miles', '8 miles', '5 miles', 'Rest', '5 miles', '20 miles']
  @intermediate[14] = ['Cross', '5 miles', '5 miles', '5 miles', 'Rest', '8 miles', '12 miles']
  @intermediate[15] = ['Cross', '5 miles', '8 miles', '5 miles', 'Rest', '5 miles', '20 miles']
  @intermediate[16] = ['Cross', '5 miles', '6 miles', '5 miles', 'Rest', '4 miles', '12 miles']
  @intermediate[17] = ['Cross', '4 miles', '5 miles', '4 miles', 'Rest', '3 miles', '8 miles']
  @intermediate[18] = ['Cross', '3 miles', '4 miles', 'Rest', 'Rest', '2 miles',	'26 miles']
end

# This method formats dates, so that they can be used with Date functions (adding and subtracting dates).
def format_date(date)
   @fixed_date = date.gsub('-',',')
   @new_array = @fixed_date.split(',')
  @current_formatted_marathon_date = DateTime.new(@new_array[0].to_i, @new_array[1].to_i, @new_array[2].to_i)
end

# This is a getter method for marathon info, so pages within the Tracker can obtain settings. If they have not created settings, it will redirect them to the set up page.
def provide_marathon_info
  if @current_marathon_name = Setting.find_by(account_id: @user_id) == nil
    redirect '/setting/set_up'
  else

  @current_marathon_name = Setting.find_by(account_id: @user_id).marathon_name
  @current_unformatted_marathon_date = Setting.find_by(account_id: @user_id).marathon_date
  @current_skill_level = Setting.find_by(account_id: @user_id).skill_level

end
end

# This method tells the page what day it is.
def set_date
  @current_date = Date.today
  @current_week = @current_date.strftime("%W")
end

# This method provides the first day that the user's training program should begin.
def set_training_start
  @trainingStart = @current_formatted_marathon_date - 125
  @week_one = @trainingStart.strftime("%W")
end

# I think I can delete this function. Double check that not using it anymore.
def how_many_weeks_away
  if @week_one.to_i - @current_week.to_i < 0
    return @weeks_away = -1 * (@week_one.to_i - @current_week.to_i)
  elsif @week_one.to_i - @current_week.to_i > 0
    return @weeks_away = @week_one.to_i - @current_week.to_i
  else
    return @weeks_away = 'Zero'
  end
end

# This method will provide how many days until training starts, based off the current date.
def set_days_until
  @days_until = @trainingStart - @current_date
  @days_until_formatted = @days_until.to_i
end

# This method provides the week number of training. This is incredibly important and triggers much of what is displayed on the dashboard.
def give_training_week_number(argument, weeks_ago)
  @weeks_ago = weeks_ago
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
    # @training_week_number_history = @training_week_number - @weeks_ago
end

# This method says how far the user has run in TOTAL, across all weeks/all logged data.
def tracker_total_distance
    provide_user_id
    @current_marathon_settings_id = Setting.find_by(account_id: @user_id).id
    @select_tracker_for_total_distance = Tracker.where(settings_id: @current_marathon_settings_id)

    @tracker_json = JSON.parse(@select_tracker_for_total_distance.to_json)

      @total_distance_run = 0
    for inc in 0..17
        if @tracker_json[inc]
         @total_distance_run = @total_distance_run.to_i + @tracker_json[inc]["distance_mon"].to_i + @tracker_json[inc]["distance_tues"].to_i + @tracker_json[inc]["distance_wed"].to_i + @tracker_json[inc]["distance_thurs"].to_i + @tracker_json[inc]["distance_fri"].to_i +
        @tracker_json[inc]["distance_sat"].to_i + @tracker_json[inc]["distance_sun"].to_i
    end
    end
end

# This method is similar to an authorization check. It sees if the user has started training yet. If not, it directs them away from the dashboard and to a countdown page.
def has_training_started
      if @days_until_formatted.to_i > 0
        redirect '/tracker/countdown'
      end
end

def provide_already_logged_data
  @select_tracker_for_current_week = Tracker.where(settings_id: @current_marathon_settings_id, week: @training_week_number)
  if @select_tracker_for_current_week != []
  @select_tracker_for_current_week_json = JSON.parse(@select_tracker_for_current_week.to_json)
else
  @select_tracker_for_current_week_json = [{"distance_mon"=>"", "distance_tues"=>"", "distance_wed"=>"", "distance_thurs"=>"", "distance_fri"=>"", "distance_sat"=>"", "distance_sun"=>""}]
end
end



# ALL GET ROUTES  ARE BELOW

  get '/countdown' do
    provide_user_id
    provide_user_name
    create_novice
    provide_marathon_info
    set_date
    format_date(@current_unformatted_marathon_date)
    set_training_start
    set_days_until
    set_days_until
    erb :countdown
  end

  get '/dashboard' do

    provide_user_id
    provide_user_name
    create_novice
    provide_marathon_info
    set_date
    format_date(@current_unformatted_marathon_date)
    set_training_start
    how_many_weeks_away
    set_days_until
    give_training_week_number(@days_until_formatted, 1)
    tracker_total_distance
    has_training_started
    provide_already_logged_data
    erb :dashboard

  end
  # ^ end of get dashboard



  post '/dashboard' do
    provide_user_id
    @current_marathon_settings_id = Setting.find_by(account_id: @user_id).id

# This checks if the week has already been submitted. If so, it will update it, rather than create a duplicate record. This code also makes sure that if the user doesn't enter a value, it does not overwrite that line.
    @select_tracker = Tracker.find_by(settings_id: @current_marathon_settings_id, week: params[:week])
    if @select_tracker
      @tracker = @select_tracker
if params[:distance_mon] != ""
      @tracker.distance_mon = params[:distance_mon]
    end
    if params[:distance_tues] != ""
      @tracker.distance_tues = params[:distance_tues]
    end
    if params[:distance_wed] != ""
      @tracker.distance_wed = params[:distance_wed]
    end
    if params[:distance_thurs] != ""
      @tracker.distance_thurs = params[:distance_thurs]
    end
    if params[:distance_fri] != ""
      @tracker.distance_fri = params[:distance_fri]
    end
    if params[:distance_sat] != ""
      @tracker.distance_sat = params[:distance_sat]
    end
    if params[:distance_sun] != ""
      @tracker.distance_sun = params[:distance_sun]
    end
      @tracker.save
      redirect '/tracker/dashboard'
# If it arrives to the else statement, it means it is a new week and it will create a new line in the table
else
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

  get '/dashboard_week' do
    provide_user_id
    provide_user_name
    create_novice
    provide_marathon_info
    set_date
    format_date(@current_unformatted_marathon_date)
    set_training_start
    how_many_weeks_away
    set_days_until
    give_training_week_number(@days_until_formatted, 1)
    tracker_total_distance
    has_training_started

    erb :dashboard_week
  end



# FIGURING OUT SELECT METHOD TO TOGGLE
# post '/dashboard_week' do
#   @weeks_ago = params[:weeks_ago_form]
#   erb :dashboard_week
# end

# <form action="/tracker/dashboard_week" method="post">
#     <select name='weeks_ago_selecter' onchange='if(this.value != 0) { this.form.submit(); }'>
#          <option name="weeks_ago_form" value='0'>1 Week Ago</option>
#          <option name="weeks_ago_form" value='1'>2 Weeks Ago</option>
#          <option name="weeks_ago_form" value='2'>3 Weeks Ago</option>
#          <option name="weeks_ago_form" value='3'>4 Weeks Ago</option>
#     </select>
# </form>

end
