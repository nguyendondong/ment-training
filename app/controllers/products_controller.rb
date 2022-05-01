class ProductsController < ApplicationController
    skip_before_action :authenticate_user!,  only: %i[ show index]
    before_action :set_product, only: %i[ show]
    def index
    end
    def show
        @taxons= Taxon.all
    end
   
    private
        def set_product
        @product = Product.find(params[:id])
        end
    
end