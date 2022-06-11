class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increment_like_counter

  def increment_like_counter
    post.increment!(:like_count)  
  end
end
