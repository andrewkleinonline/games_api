class VideoGameSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_date, :developer, :publisher, :genre, :series, :review_score
  has_many :consoles
end
