class QuestionaryChoice < ApplicationRecord
    belongs_to :questionary_item

    validates :content, :value, presence: {message: 'は、必須です'}
    validates :value, numericality: true

    # TODO: ↓ ただのユニークではだめ。questionary_item_idと絡めて考える必要がある。とりあえず放置。
    # validates :value, uniqueness: true
    
    # validates :value, numericality: {message: 'は、必須です'}
end
