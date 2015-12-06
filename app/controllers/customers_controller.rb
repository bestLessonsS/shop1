class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html {redirect_to @customer, notice: "Customer was created"}
      else
        flash[:alert] = "Error on creatin customer"
        format.html {render :new}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html {redirect_to @customer, notice: "Customer was updated"}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html {redirect_to customers_url, notice: "Customer was delete"}
    end
  end


  def show
    @currentOrder = Order.where(customer_id: @customer.id, status: 'placed').first
    
    if(params[:unavailable])
      @unavailableProducts = OrdersController.listUnavailableProducts @currentOrder
      respond_to do |format|
        format.js
      end
    else
      @customerOrders = Order.where(customer_id: @customer.id, status: 'ready')
      @currentOrderElements = OrderElement.where(order_id: @currentOrder.id) if @currentOrder
      @currentOrderSum = OrdersController.calculateTotal(@currentOrder) if @currentOrder
    end

  end

  

  private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name, :surname, :street, :city, :country, :zip_code)
    end

end
