class CsvController < ApplicationController
    def create
      Post.import params[:file]
      redirect_to root_url, notice: t("Post imported")
    end
  end
 