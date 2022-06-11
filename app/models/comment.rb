class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increment_comment_counter

  def increment_comment_counter
    post.increment!(:comment_count)
  end
end
