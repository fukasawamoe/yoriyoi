class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :schedules
  has_one :goal

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 15 }

  after_create :set_first_login

  def set_first_login
    self.first_login = true
    save
  end
end
