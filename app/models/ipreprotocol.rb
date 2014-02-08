class Ipreprotocol < ActiveRecord::Base
  include PublicActivity::Common

  validates_presence_of :cell
  validates_presence_of :lysis
  validates_presence_of :sonication
  validates_presence_of :sample_concentration
  validates_presence_of :preclearing
  validates_presence_of :primary_description
  validates_presence_of :ab_capture
  validates_presence_of :first_wash
  validates_presence_of :sample_prep
  validates_presence_of :gel
  validates_presence_of :electrophoresis
  validates_presence_of :membrane
  validates_presence_of :transfer
  validates_presence_of :blocking
  validates_presence_of :secondary_description
  validates_presence_of :second_wash
  validates_presence_of :tertiary_description
  validates_presence_of :third_wash
  validates_presence_of :detection
  validates_presence_of :information

  validates_presence_of :user
  validates_presence_of :antibody

  belongs_to :user
  belongs_to :antibody
  
end
