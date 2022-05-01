class HomesController < ApplicationController
    skip_before_action :authenticate_user!, :only => [:index]
    def index
        @posts = Post.limit(12)
        @products = Product.limit(12)
        @taxons= Taxon.limit(12)
    end
    def show
    end
   
    
    
end