class DesignerSchedule < ApplicationRecord
    belongs_to :schedule

    # include Readonlyable

    scope :current_user_records, ->(user_id) { where(user_id: user_id) }

    after_save :content_blank?
    # before_save :changed?

    def content_blank?
        if self.content.blank?
            self.destroy
        end
    end

    def changed?
        # エラー: stack level too deep
        if self.changed?
            raise "変更されています"
        end
    end
end
