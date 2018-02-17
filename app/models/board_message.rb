class BoardMessage < ApplicationRecord
    belongs_to :board_user

    validate :content, presence: {message: 'は、必須です'}
end
