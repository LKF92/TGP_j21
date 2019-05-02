class Gossip < ApplicationRecord
  validates :title, presence: true#, format: {with: /.{3,14}/, message "between 3 to 14 caracters"}
  validates :content, presence: true
  belongs_to :user
  has_many :join_tag_gossips
  has_many :tags, through: :join_tag_gossips
  has_many :comments
end
