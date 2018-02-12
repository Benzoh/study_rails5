module Readonlyable

    extend ActiveSupport::Concern

    module ClassMethods
        def save(_id)
            raise ActiveRecord::ReadOnlyRecord
        end

        def update(_id)
            raise ActiveRecord::ReadOnlyRecord
        end
        
        def delete(_id)
            raise ActiveRecord::ReadOnlyRecord
        end

        def delete_all(_conditions)
            raise ActiveRecord::ReadOnlyRecord
        end
    end

    def readonly?
        return true
    end

    def before_destroy
        raise ActiveRecord::ReadOnlyRecord
    end

end