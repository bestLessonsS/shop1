class MoviesController < ApplicationController


	before_action :set_product, only: [:show, :update, :edit, :destroy]

  def index
  	@products = Movie.all
    @customers = Customer.all
  end

  def show
  end

  def new
  	@product = Movie.new
  end

  def create
  	@product = Movie.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
      	flash[:alert] = "Error"
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  	respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private 

  	def set_product
  		@product = Movie.find(params[:id])
  	end

  	def product_params
  		params.require(:movie).permit(:name, :price, :amountAvailable, :genre, :media)
  	end

	
end
