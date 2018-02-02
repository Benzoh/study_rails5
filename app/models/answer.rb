class Answer < ApplicationRecord
    belongs_to :question

    validates :content, :name, presence: {message: 'は、必須です'}
end
