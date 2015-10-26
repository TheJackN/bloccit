class Rating < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true

  enum severity: [ :PG, :PG13, :R ]
end
