class Tag < ApplicationRecord
  has_many :taggings
  validates_length_of :name, minimum: 3, allow_blank: false
  has_many :posts, through: :taggings

 def self.tagged_with(names)
    tags = names.split(" ")
    tags = find_by_name(tags)
    tags.present? ? tags.posts : []
  end
end
