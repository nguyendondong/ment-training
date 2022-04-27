class Admin::VariantsController < ApplicationController
    include ApplicationHelper
    layout :dynamic_layout
    before_action :check_link
    before_action :set_variant, only: %i[ show edit update destroy ]
    # GET /products or /products.json
    def index
      @search = Variant.ransack(params[:q])
      @variants = @search.result
      @variants= @variants.page(params[:page]).per(10)
      
    end
  
    # GET /products/1 or /products/1.json
    def show
    end
  
    # GET /products/new
    def new
      @variant = variant.new
    end
  
    # GET /products/1/edit
    def edit
    end
  
    # POST /products or /products.json
    def create
      @variant = Variant.new(variant_params)
      respond_to do |format|
        if @variant.save
          format.html { redirect_to admin_variants_path, notice: "Product was successfully created." }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @variant.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /products/1 or /products/1.json
    def update
      respond_to do |format|
        if @variant.update(variant_params)
          format.html { render :show, notice: "Product was successfully updated." }
          format.json { render :show, status: :ok, location: @variant }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @variant.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /products/1 or /products/1.json
    def destroy
      @variant.destroy
  
      respond_to do |format|
        format.html { redirect_to admin_variants_path, notice: "Product was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_variant
        @variant = Variant.find(params[:id])
      end
     
  
      # Only allow a list of trusted parameters through.
      def variant_params
        params.require(:variant).permit(:name, :meta_title, :meta_description)
      end
end
  
