require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Name' do
    it 'should return invalid since it needs characters' do
      @user.name = ''

      expect(@user).to_not be_valid
    end

    it 'should return valid since it has characters' do
      expect(@user).to be_valid
    end
  end

  describe 'posts_counter' do
    it 'should return invalid since it need to be an integer greater than or equal to zero' do
      @user.posts_counter = -1

      expect(@user).to_not be_valid
    end

    it 'should return valid' do
      expect(@user).to be_valid
    end
  end
end
