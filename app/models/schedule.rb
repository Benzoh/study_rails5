class Schedule < ApplicationRecord
    has_many :desiger_schedules
    has_many :editor_schedules
    has_many :manager_schedules
end
