json.extract! post, :id, :title, :content, :author_id, :is_published, :created_at, :updated_at
json.url post_url(post, format: :json)