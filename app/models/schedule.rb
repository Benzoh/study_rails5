class Schedule < ApplicationRecord
    has_many :designer_schedules
    has_many :editor_schedules
    has_many :manager_schedules
    accepts_nested_attributes_for :designer_schedules, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :editor_schedules, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :manager_schedules, reject_if: :all_blank, allow_destroy: true
end
