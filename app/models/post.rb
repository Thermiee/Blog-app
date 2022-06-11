class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User'

  after_save :increment_post_counter
  after_destroy :decrement_post_counter

  validates :title, length: { minimum: 1, maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def decrement_post_counter
    author.decrement!(:post_count)
  end

  def increment_post_counter
    author.increment!(:post_count)
  end

  def recent_comments
    Comment.where(post_id: id).limit(5)
  end
end
