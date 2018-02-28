require 'rails_helper'

RSpec.describe Chat, type: :model do
  before {
    @receiver = create(:user)
    @sender = create(:user)
  }

  it 'should not have same sender and receiver' do
    chat = build(:chat, sender: @sender, receiver: @sender)
    expect(chat.valid?).to be_falsey
    expect(chat.errors[:sender]).to eql(['Sender can not be receiver.'])
  end

  it 'should not have empty message' do
    chat = build(:chat, mensaje: '', sender: @sender, receiver: @receiver)
    expect(chat.valid?).to be_falsey
  end
end