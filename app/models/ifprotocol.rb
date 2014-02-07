class Ifprotocol < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  validates_presence_of :cell
  validates_presence_of :fixation
  validates_presence_of :first_wash
  validates_presence_of :blocking
  validates_presence_of :primary_description
  validates_presence_of :second_wash
  validates_presence_of :secondary_description
  validates_presence_of :third_wash
  validates_presence_of :coverslip
  validates_presence_of :information

  validates_presence_of :user
  validates_presence_of :antibody

  belongs_to :user
  belongs_to :antibody
  
end
