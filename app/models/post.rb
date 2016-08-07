class Post < ApplicationRecord
  #### Attributes ######

  ####### Relationships #####
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :taggings
  has_many :tags, through: :taggings
  # #validations###
  validates :author_id, presence: true
  validates :title, :content, presence: true

  def all_tags=(tags)
    self.tags = tags.split(',').map do |tag|
      Tag.where(name: tag.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(', ')
  end
end
