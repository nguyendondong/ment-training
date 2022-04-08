class Admin::DashboardsController < ApplicationController
    include ApplicationHelper
    before_action :check_link
    def index
        # @products = Product.all.page(params[:page]).per(10)
    end

    

end