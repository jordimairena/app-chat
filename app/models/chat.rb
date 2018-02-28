class Chat < ApplicationRecord
	belongs_to :sender, class_name: 'User', foreign_key: :id_e
	belongs_to :receiver, class_name: 'User', foreign_key: :id_r
	validate :sender_receiver_uniqueness

  private

  def sender_receiver_uniqueness
    if sender == receiver
      errors.add(:sender, 'Sender can not be receiver.')
      errors.add(:receiver, 'Receiver can not be sender.')
    end
  end
end
