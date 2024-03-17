class Book < ApplicationRecord
  belongs_to :author

  validates :title, presence: true, length: { minimum: 1 }
end
