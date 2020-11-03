json.extract! comment, :id, :body, :author_id, :blog_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
