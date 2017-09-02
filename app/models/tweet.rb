class Tweet < ActiveRecord::Base
  belongs_to :compilation
  validates_presence_of :link
  
end