module NavigationHelpers
  module Refinery
    module SignUps
      def path_to(page_name)
        case page_name
        when /the list of sign_ups/
          admin_sign_ups_path

         when /the new sign_up form/
          new_admin_sign_up_path
        else
          nil
        end
      end
    end
  end
end
