class QuestionaryResult < ApplicationRecord
    belongs_to :questionary

    validates :result, presence: {message: 'は、必須です。'}
end
