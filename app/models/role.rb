class Role < ApplicationRecord
  has_many :users

scope :non_admin_roles, -> {where("name != 'admin'")}
  def self.admin
    where(name: 'admin').first_or_create
  end
end
