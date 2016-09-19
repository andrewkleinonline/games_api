class ConsoleSerializer < ActiveModel::Serializer
  attributes :id, :name, :manufacturer, :release_date
  has_many :video_games
end
