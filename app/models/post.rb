class Post < ApplicationRecord
	belongs_to :author,class_name: "User"
	validate [:title,:content] ,presence: true
end
