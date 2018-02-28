require 'rails_helper'
require 'cancan/matchers'

describe 'Ability' do
  describe 'As Admin' do
    before {
      @admin = create(:admin_user)
      @ability = Ability.new(@admin)
    }
    it 'can edit and delete chat' do
      expect(@ability).to be_able_to(:delete, :chats)
      expect(@ability).to be_able_to(:update, :chats)
    end
  end

  describe 'As User and Trainer' do
    before {
      @user = create(:user)
      @trainer = create(:trainer_user)
      @user_ability = Ability.new(@user)
      @trainer_ability = Ability.new(@trainer)
    }
    it 'can not edit or delete chat' do
      expect(@user_ability).not_to be_able_to(:delete, :chats)
      expect(@user_ability).not_to be_able_to(:update, :chats)
      expect(@trainer_ability).not_to be_able_to(:delete, :chats)
      expect(@trainer_ability).not_to be_able_to(:update, :chats)
    end
  end
end