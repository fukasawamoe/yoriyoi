class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  has_many :schedules, dependent: :destroy
  has_one :goal, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_one :character, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 15 }

    # ユーザー作成後に呼び出されるコールバック
  after_create :assign_default_character

  private


  # デフォルトキャラクターの属性を持つキャラクターを作成
  def assign_default_character
    create_character(
      name: 'ねこちゃん',
      personality: '友達思いのやさしい',
      communication_style: 'フレンドリー',
      relationship: '相棒',
      additional: 'いつもそばにいる',
      image: 'cat_notification.png' # デフォルトのアバター画像ファイル名
    )
  end
end
