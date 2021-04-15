module ApplicationHelper

    def active_class(path)
        if request.path == path
          return 'active'
        else
          return ''
        end
      end

    def valid_interests
      User::INTEREST_TAGS.map{ |m| [m] }
    end
end
