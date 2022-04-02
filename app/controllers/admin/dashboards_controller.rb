class Admin::DashboardsController < ApplicationController
    include ApplicationHelper
    before_action :check_link
    def index
        @products = Product.all
    end

    

end