class Admin::DashboardsController < ApplicationController
    include ApplicationHelper
    layout :dynamic_layout  
    before_action :check_link
    def index
        
    end

    

end