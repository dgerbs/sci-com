class Antibody < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  include PgSearch
  pg_search_scope :search, against: [:product, :antibody, :target, :vendor, :isotype],
    using: { tsearch: { dictionary: "english" } },
    associated_against: { ihcprotocols: :tissue, ibprotocols: :cell_tissue, ifprotocols: :cell, ipreprotocols: :cell }

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
      rank = <<-RANK
        ts_rank(to_tsvector(product),  plainto_tsquery(#{sanitize(query)})) +
        ts_rank(to_tsvector(antibody), plainto_tsquery(#{sanitize(query)})) +
        ts_rank(to_tsvector(target),   plainto_tsquery(#{sanitize(query)})) +
        ts_rank(to_tsvector(vendor),   plainto_tsquery(#{sanitize(query)})) +
        ts_rank(to_tsvector(isotype),  plainto_tsquery(#{sanitize(query)}))
      RANK
      where("product @@ :q or antibody @@ :q or target @@ :q or vendor @@ :q or isotype @@ :q", q: query).order("target desc")
    else
      scoped
    end
  end

  has_reputation :votes, source: :user, aggregated_by: :sum
end
