class Flowprotocol < ActiveRecord::Base
  include PublicActivity::Common

  validates_presence_of :cell
  validates_presence_of :fixation
  validates_presence_of :incubation
  validates_presence_of :permeabilization
  validates_presence_of :cell_number
  validates_presence_of :first_wash
  validates_presence_of :immunostain_vol
  validates_presence_of :primary_description
  validates_presence_of :second_wash
  validates_presence_of :secondary_description
  validates_presence_of :third_wash
  validates_presence_of :final_vol
  validates_presence_of :information

  validates_presence_of :user_id
  validates_presence_of :antibody_id

  belongs_to :user
  belongs_to :antibody
  
end
