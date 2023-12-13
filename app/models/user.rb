require 'open-uri'
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
  # activestorage-validator による添付画像の検証
  # validates :images,
  # content_type: %i(gif png jpg jpeg),                        # 画像の種類
  # size: { less_than_or_equal_to: 5.megabytes },              # ファイルサイズ
  # dimension: { width: { max: 2000 }, height: { max: 2000 } } # 画像の大きさ

    # ユーザー作成後に呼び出されるコールバック
  after_create :assign_default_character

  private


  # デフォルトキャラクターの属性を持つキャラクターを作成
  def assign_default_character
    # Cloudinaryにアップロード済みのデフォルト画像のURL
    default_image_url = "https://res.cloudinary.com/dkxx3dybs/image/upload/v1702127528/cat_notification_kwprga.png"
    self.create_character(
      name: 'ねこちゃん',
      personality: 'kind',
      communication_style: 'Casual Japanese',
      relationship: 'friend',
      additional: ''
    )

    if self.character.present?
      # Cloudinaryの画像URLからアタッチ
      self.character.image.attach(io: URI.parse(default_image_url).open, filename: 'cat_notification.png')

      # Character インスタンスを保存
      self.character.save!
    end
  end
end
