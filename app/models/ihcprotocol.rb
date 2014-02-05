class Ihcprotocol < ActiveRecord::Base

  validates_presence_of :tissue
  validates_presence_of :fixation
  validates_presence_of :first_wash
  validates_presence_of :methpero
  validates_presence_of :second_wash
  validates_presence_of :blocking
  validates_presence_of :primary_description
  validates_presence_of :third_wash
  validates_presence_of :signal
  validates_presence_of :fourth_wash
  validates_presence_of :dehydration
  validates_presence_of :mounting
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
