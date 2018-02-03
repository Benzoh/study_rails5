class QuestionaryChoice < ApplicationRecord
    belongs_to :questionary_item

    validates :content, :value, presence: {message: 'は、必須です'}
    validates :value, numericality: {message: 'は、必須です'}
end
