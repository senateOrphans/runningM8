class TrackerController < ApplicationController

  get '/dashboard' do
    @novice = Hash.new
    @novice[1] = ['Rest', '3 miles', '3 miles', '3 miles', 'Rest', '6', 'Cross']
    erb :dashboard

  end


end
