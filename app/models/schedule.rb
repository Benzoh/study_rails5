class Schedule < ApplicationRecord

    # include Readonlyable

    cattr_accessor :user_id

    # has_many :designer_schedules
    # TODO: indexとshowでは除外する
    has_many :designer_schedules
    has_many :editor_schedules
    has_many :manager_schedules
    accepts_nested_attributes_for :designer_schedules, allow_destroy: true
    accepts_nested_attributes_for :editor_schedules, allow_destroy: true
    accepts_nested_attributes_for :manager_schedules, allow_destroy: true

    scope :with_child_models, ->() {
        joins(:designer_schedules, :editor_schedules, :manager_schedules)
    }

    # scope :with_designer_schedules, ->(user_id) { joins(:designer_schedules).merge(DesignerSchedule.current_user_records(user_id)}
    
    scope :with_id, ->(id) { find_by(id: id) }
    # scope :with_current_user, -> { joins(:designer_schedules).merge(DesignerSchedule.current_user_records) }

    def _test
        'Test is.'
    end

end
