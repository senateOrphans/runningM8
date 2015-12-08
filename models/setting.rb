class Setting < ActiveRecord::Base
  belongs_to :account
  has_many :trackers
end
