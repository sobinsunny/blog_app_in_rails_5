class Post < ApplicationRecord
	belongs_to :author ,:class=>"User"
	validate [:title,:content] presence: true
end
