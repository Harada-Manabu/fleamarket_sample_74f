class Identification < ApplicationRecord
  belongs_to :user, optional: true
  validates :birthday, presence: true


  validates :familyName, :firstName, presence: true,
                                      format: {
                                      with: /\A[ぁ-んァ-ヶー一-龠]+\z/,
                                      message: "は全角で入力してください"
                                      }

  validates :familyNameKana, :firstNameKana, presence: true,
                                      format: {
                                        with: /\A[ぁ-ん]+\z/,
                                        message: "は全角ひらがなで入力してください"
                                      }

end
