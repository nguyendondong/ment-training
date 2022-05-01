class Admin::VariantsController < ApplicationController
  include ApplicationHelper
  layout :dynamic_layout
  before_action :set_variant, only: %i[ show edit update destroy  ]
  before_action :check_link
  # GET /variants or /variants.json
  def index
    @product = Product.find(params[:product_id])
    @variants = @product.variants

  end

  # GET /variants/1 or /variants/1.json
  def show

  end

  # GET /variants/new
  def new
    @product = Product.find(params[:product_id])
    @variant = Variant.new
  end

  # GET /variants/1/edit
  def edit
    
  end


  # POST /variants or /variants.json
  def create
    @variant = Variant.new(variant_params)
    @variant.product_id = params[:product_id]
    respond_to do |format|
      if @variant.save
        format.html { redirect_to admin_product_variants_path , notice: "variant was successfully created." }
        format.json { render :show, status: :created, location: @variant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variants/1 or /variants/1.json
  def update
    respond_to do |format|
      if @variant.update(variant_params)
        format.html {render :show, notice: "variant was successfully updated." }
        format.json { render :show, status: :ok, location: @variant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variants/1 or /variants/1.json
  def destroy
    @variant.destroy

    respond_to do |format|
      format.html { redirect_to admin_variants_path, notice: "variant was successfully destroyed." }
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
      params.require(:variant).permit(:sku,:color, :size, :cost_price,{pictures:[]},:product_id)
    end
end
