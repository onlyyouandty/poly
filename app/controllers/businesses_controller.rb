class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  def index
    @businesses = Business.all
    respond_with(@businesses)
  end

  def show
    @business = Business.find(params[:id])
    respond_with(@business)
  end

  def new
    @business = Business.new
    respond_with(@business)
  end

  def edit
    @business = Business.find(params[:id])
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to businesses_path, notice: "The business has been successfully created"
    end
    respond_with(@business)
  end

  def update
    @business = Business.find(params[:id])
    if @business.update_attributes(business_params)
      redirect_to businesses_path, notice: "The business has been updated"
    end
    respond_with(@business)
  end

  def destroy
    @business = Business.find(params[:id])
    @business.destroy
    respond_with(@business)
  end

  private
    def set_business
      @business = Business.find(params[:id])
    end

    def business_params
      params.require(:business).permit(:name)
    end
end
