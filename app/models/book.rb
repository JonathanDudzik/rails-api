class Book < ApplicationRecord
    has_one_attached :image

    validates :title, presence: { message: 'The title must be entered' }
    validates :published, allow_blank: true, numericality: { only_integer: true, message: 'The year must be a number'}
end
