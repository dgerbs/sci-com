class AddSearchIndexToAntibodies < ActiveRecord::Migration
  def up
    execute "create index antibodies_product on antibodies using gin(to_tsvector('english', product))"
    execute "create index antibodies_antibody on antibodies using gin(to_tsvector('english', antibody))"
    execute "create index antibodies_target on antibodies using gin(to_tsvector('english', target))"
    execute "create index antibodies_vendor on antibodies using gin(to_tsvector('english', vendor))"
    execute "create index antibodies_isotype on antibodies using gin(to_tsvector('english', isotype))"
  end

  def down
    execute "drop index antibodies_product"
    execute "drop index antibodies_antibody"
    execute "drop index antibodies_target"
    execute "drop index antibodies_vendor"
    execute "drop index antibodies_isotype"
  end
end
