class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 15 }

  def mine?(object)
    # 呼び出し元のオブジェクトのIDを示す self.id を省略した記法。
    # @user.mine?(object)のように利用すると、object.user_id と @user.id を比較する。
    object.user_id == id
  end
end
