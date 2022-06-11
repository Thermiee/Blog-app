require 'rails_helper'

RSpec.describe Post, type: :model do 

  describe 'Title' do
    it 'should return invalid since it needs characters' do
      @post.title = ''

      expect(@post).to_not be_valid
    end

    it 'should return invalid since it has more than 250 characters' do
      @post.title = 'a' * 251
      expect(@post).to_not be_valid
    end

    it 'should return valid since it\'s between 0 and 250 characters' do
      @post.title = 'a' * 50
      expect(@post).to be_valid
    end
  end

  describe 'comments_counter' do
    it 'should return invalid since it need to be an integer greater than or equal to zero' do
      @post.comments_counter = -1

      expect(@post).to_not be_valid
    end

    it 'should return valid' do
      expect(@post).to be_valid
    end
  end

  describe 'likes_counter' do
    it 'should return invalid since it need to be an integer greater than or equal to zero' do
      @post.likes_counter = -1

      expect(@post).to_not be_valid
    end

    it 'should return valid' do
      expect(@post).to be_valid
    end
  end
end
