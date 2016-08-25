class Post < ApplicationRecord
  #### Attributes ######
  after_initialize :default_values

  ####### Relationships #####
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :sharing
  ## Callbacks ##
  after_create :set_default_share_user

  ##validations###

  validates :author_id,presence: true
  validates :title, :content, presence: true

  def all_tags=(tags)
    self.tags = tags.split(",").map do |tag|
      Tag.where(name:tag.strip).first_or_create!
    end
  end
  
  def all_tags
    self.tags.map(&:name)
  end
  def set_default_share_user
    Sharing.create(:post_id=>self.id,:user_id=>self.author_id)
  end

private

  def default_values
    self.is_published = false
  end

end
