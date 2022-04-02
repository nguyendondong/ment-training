class HomesController < ApplicationController
    skip_before_action :authenticate_user!, :only => [:index]
    def index
        @posts = Post.limit(50)
        @products = Product.limit(50)
    end
    
end