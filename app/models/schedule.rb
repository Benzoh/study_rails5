class Schedule < ApplicationRecord

    cattr_accessor :user_id

    # has_many :designer_schedules
    # TODO: indexとshowでは除外する
    has_many :designer_schedules, -> { where(user_id: :user_id) }
    has_many :editor_schedules
    has_many :manager_schedules
    accepts_nested_attributes_for :designer_schedules, reject_if: :content_blank, allow_destroy: true
    accepts_nested_attributes_for :editor_schedules, reject_if: :content_blank, allow_destroy: true
    accepts_nested_attributes_for :manager_schedules, reject_if: :content_blank, allow_destroy: true

    def content_blank
        # if self.designer_schedules_attributes["0"].blank?
        #     return true
        # end
    end
end
