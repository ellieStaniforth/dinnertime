class Recipe < ApplicationRecord
  include PgSearch::Model
  paginates_per 20
  pg_search_scope :search_by_ingredients, against: :ingredients, using: {:tsearch => {prefix: true}}
  validates :title, :ingredients, presence: true
end