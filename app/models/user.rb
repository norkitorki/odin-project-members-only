class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username,
    presence: true,
    uniqueness: true,
    length: { maximum: 40 }

  validates :password,
    presence: true,
    length: { minimum: 6 },
    if: :new_record?

end
