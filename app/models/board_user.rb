class BoardUser < ApplicationRecord
    belongs_to :account
    has_many :board_message

    validate :nickname, presence: {message: 'は、必須です'}
end
