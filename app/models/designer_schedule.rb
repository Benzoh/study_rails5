class DesignerSchedule < ApplicationRecord
    belongs_to :schedule

    scope :current_user_records, ->(user_id) { where(user_id: user_id) }

    after_save :content_blank?

    def content_blank?
        if self.content.blank?
            self.destroy
        end
    end
end
