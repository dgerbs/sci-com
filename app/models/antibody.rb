class Antibody < ActiveRecord::Base

  validates_presence_of :product
  validates_presence_of :antibody
  validates_presence_of :target
  validates_presence_of :vendor
  validates_presence_of :isotype

  has_many :ihcprotocols, dependent: :destroy
end
