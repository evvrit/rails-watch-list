class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie_id, uniqueness: { scope: :list_id,
  message: "--that movie is already in that list" }

  validates :list_id, uniqueness: { scope: :movie_id,
  message: " --that list already contains that movie" }

  validates :comment, length: { minimum: 6 }
end
