class TaxonsController < ApplicationController
    skip_before_action :authenticate_user!,  only: %i[ show index]
    before_action :set_taxon, only: %i[ show]
    def index
        @taxons= Taxon.all
    end
    def show
       @taxons = Taxon.limit(12)
       @products = @taxon.products
    end
    private
        def set_taxon
        @taxon = Taxon.find(params[:id])
        end
    
end