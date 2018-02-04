class DesignerSchedule < ApplicationRecord
    belongs_to :schedule

    before_save :check_user_id

    def check_user_id
        existing_deta = DesignerSchedule.find_by(id: self.id)
        if !existing_deta.blank? && self.user_id != existing_deta.user_id
            self.user_id = existing_deta.user_id
            # raise
        else
            # raise
            # return false
        end
    end
end
