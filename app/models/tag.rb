class Tag < ApplicationRecord
  has_many :taggings
  validates_length_of :name, minimum: 3, allow_blank: false
  has_many :posts, through: :taggings

 def self.tagged_with(names)
    tags = names.split(" ")
    find_by_name(tags).posts
  end
end
