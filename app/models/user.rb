class User < ApplicationRecord
  has_paper_trail

  has_secure_password

  validates :email,
    presence: true,
    uniqueness: true

  scope :active, -> { where(archive: false) }
end
