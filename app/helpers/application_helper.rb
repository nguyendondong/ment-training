module ApplicationHelper
    def is_admin?
         current_user.role.name == "admin"
    end
    def check_link
        if !is_admin?
          redirect_to  root_path 
        end
      end
      def dynamic_layout
        if is_admin?
          "admin"
        else
          "application"
        end
      end
end
