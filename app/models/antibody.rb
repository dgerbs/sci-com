class Antibody < ActiveRecord::Base

  include PgSearch
  pg_search_scope :search, against: [:product, :antibody, :target, :vendor, :isotype],
    using: { tsearch: { dictionary: "english" } }

  validates_presence_of :product
  validates_presence_of :antibody
  validates_presence_of :target
  validates_presence_of :vendor
  validates_presence_of :isotype

  has_many :ihcprotocols,  dependent: :destroy
  has_many :ibprotocols,   dependent: :destroy
  has_many :ifprotocols,   dependent: :destroy
  has_many :ipreprotocols, dependent: :destroy

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

  has_reputation :votes, source: :user, aggregated_by: :sum
end
