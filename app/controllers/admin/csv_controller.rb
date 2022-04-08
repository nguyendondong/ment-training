class Admin::CsvController < ApplicationController
    def create_post
      Post.import params[:file]
      redirect_to admin_posts_path, notice: t("Post imported")
    end
    def create_product
      Product.import params[:file]
      redirect_to admin_path, notice: t("Product imported")
    end
  end
 