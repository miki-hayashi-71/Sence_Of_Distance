class User < ApplicationRecord
  authenticates_with_sorcery!

  # 3文字以上（新規レコード作成もしくはcrypted_passwordカラムが更新される時のみ適応）
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  # 値が空でない・passwordの値と一致する（新規レコード作成もしくはcrypted_passwordカラムが更新される時のみ適応）
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  # 値が空でない・255文字以下
  validates :name, presence: true, length: { maximum: 255 }
  # 値が空でない・ユニークな値
  validates :email, presence: true, uniqueness: true
end
