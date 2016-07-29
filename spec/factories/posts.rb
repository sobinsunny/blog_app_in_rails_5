FactoryGirl.define do
  factory :post do
    title "MyString"
    content "MyString"
    author_id 1
    is_published false
  end
end
