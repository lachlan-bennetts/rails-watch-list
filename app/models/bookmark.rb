class Bookmark < ApplicationRecord
  validates :comment, length: { minimum: 6 }
  belongs_to :movie, foreign_key: "movie_id"
  belongs_to :list, foreign_key: "list_id"
  validates_uniqueness_of :movie_id, scope: :list_id
end
