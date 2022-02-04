class ImageValidator < ActiveModel::Validator
    def validate(record)
        @record = record
        @acceptableContentTypes = %w(image/gif image/jpeg image/png)
        unless @record.image.attached? && @acceptableContentTypes.include?(@record.image.content_type)
            record.errors.add :image, "Image must be attached and a GIF, JPEG, or PNG file"
        end
    end
end

class Book < ApplicationRecord
    has_one_attached :image

    validates :title, presence: { message: 'The title must be entered' }
    validates :published, allow_blank: true, numericality: { only_integer: true, message: 'The year must be a number'}
    validates_with ImageValidator
end
