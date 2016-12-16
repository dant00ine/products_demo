class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  end

  def create
    @product = Product.new(name: params[:name], description: params[:description], price: params[:price], user_id: session[:user_id])
    if @product.valid?
      @product.save
      flash[:message] = "Successfully added product"
      redirect_to "/products"
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to "/products/new"
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
      if @product.update(name: params[:name], description: params[:description], price: params[:price])
        flash[:message] = "Successfully updated product info"
        redirect_to "/products/#{@product.id}"
      else
        flash[:errors] = @product.errors.full_messages
        redirect_to "/products/#{@product.id}/edit"
      end


  end

  def delete
    Product.destroy(params[:id])
    flash[:message] = "Successfully deleted record"
    redirect_to "/products"
  end
end
