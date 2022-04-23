class Admin::TaxonsController < ApplicationController
        include ApplicationHelper
        layout :dynamic_layout
        before_action :check_link
        before_action :set_taxon, only: %i[ show edit update destroy ]
        # GET /products or /products.json
        def index
          @search = Taxon.ransack(params[:q])
          @taxons = @search.result
          @taxons= @taxons.page(params[:page]).per(10)
          
        end
      
        # GET /products/1 or /products/1.json
        def show
        end
      
        # GET /products/new
        def new
          @taxon = Taxon.new
        end
      
        # GET /products/1/edit
        def edit
        end
      
        # POST /products or /products.json
        def create
          @taxon = Taxon.new(taxon_params)
          respond_to do |format|
            if @taxon.save
              format.html { redirect_to admin_taxons_path, notice: "Product was successfully created." }
              format.json { render :show, status: :created, location: @product }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @taxon.errors, status: :unprocessable_entity }
            end
          end
        end
      
        # PATCH/PUT /products/1 or /products/1.json
        def update
          respond_to do |format|
            if @taxon.update(taxon_params)
              format.html { render :show, notice: "Product was successfully updated." }
              format.json { render :show, status: :ok, location: @taxon }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @taxon.errors, status: :unprocessable_entity }
            end
          end
        end
      
        # DELETE /products/1 or /products/1.json
        def destroy
          @taxon.destroy
      
          respond_to do |format|
            format.html { redirect_to admin_taxons_path, notice: "Product was successfully destroyed." }
            format.json { head :no_content }
          end
        end
      
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_taxon
            @taxon = Taxon.find(params[:id])
          end
         
      
          # Only allow a list of trusted parameters through.
          def taxon_params
            params.require(:taxon).permit(:name, :meta_title, :meta_description)
          end
end
      
