class Setting < ActiveRecord::Base
  belongs_to :accounts
  has_many :trackers
end
