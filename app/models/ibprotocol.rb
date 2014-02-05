class Ibprotocol < ActiveRecord::Base

  validates_presence_of :cell_tissue
  validates_presence_of :lysis
  validates_presence_of :sonication
  validates_presence_of :sample_size
  validates_presence_of :sample_loading
  validates_presence_of :gel
  validates_presence_of :electrophoresis
  validates_presence_of :membrane
  validates_presence_of :transfer
  validates_presence_of :blocking
  validates_presence_of :primary_description
  validates_presence_of :first_wash
  validates_presence_of :secondary_description
  validates_presence_of :second_wash
  validates_presence_of :detection
  validates_presence_of :information
  
  validates_presence_of :user
  validates_presence_of :antibody

  belongs_to :user
  belongs_to :antibody

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
      user_id: user.id)
  end
end
