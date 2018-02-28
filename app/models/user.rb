class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :sent_chats, class_name: 'Chat',foreign_key: :id_e
  has_many :received_chats, class_name: 'Chat', foreign_key: :id_r


  validates :usuario, uniqueness: true

  scope :non_admin_users, -> {where('role_id != ?', Role.admin.id)}
  scope :trainers, -> {where(role: Role.trainer)}
  scope :users, -> {where(role: Role.user)}

  def chats
    Chat.where('id_e = ? or id_r = ?', self.id, self.id).order(:created_at)
  end

  def self.define_role_helpers
    Role.all.each do |role|
      define_method(role.name+'?') { id_r == self.id_r }
    end
  end

  def method_missing(method_name, *arguments, &block)
    if method_name.to_s[-1] == '?'
      self.class.define_role_helpers
      self.send(method_name)
    else
      super
    end
  end
end