module Admin
  class SignUpsController < Admin::BaseController

    crudify :sign_up,
            :title_attribute => 'name', :xhr_paging => true

  end
end
