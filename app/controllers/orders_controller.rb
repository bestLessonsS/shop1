class OrdersController < ApplicationController
  def index
  	@orders = Order.all
    if params[:status] == 'ready'
      @orders = listOrdersToShip @orders
    end
  end

  def listOrdersToShip orders
    orders.where(status: 'ready')
  end

  def destroy
  	@order = Order.find(params[:id]) 
  	@order.destroy
  	respond_to do |format|
  		format.html {redirect_to orders_index_path, notice: "Order was delete"}
  	end
  end

  def update
    @order = Order.find(params[:id])
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_to_cart
  	
  	unless @order = Order.where(customer_id: params[:order][:customer_id], status: 'placed').last
  		@order = Order.create(order_params)
  	end
  	if @orderElement = OrderElement.where(order_id: @order.id, product_id: params[:product_id]).first
      @orderElement.amount += params[:number].to_i;
      @orderElement.save;
    else
      @orderElement = OrderElement.create(amount: params[:number], order_id: @order.id, product_id: params[:product_id]);
  	end

  	respond_to do |format|
  		msg = { :status => 'ok', :order_product_name => @orderElement.product.name, :link_to_cart => view_context.link_to("Show order", @order.customer, class: "btn btn-primary") }
  		format.json { render :json => msg}
  	end
  end

  def self.calculateTotal order
    elements = OrderElement.where(order_id: order.id)
    sum = 0;
    elements.each do |elem|
      sum += elem.amount*elem.product.price;
    end
    sum
  end


  def self.listUnavailableProducts order
    elements = OrderElement.where(order_id: order.id)
    b = [];
    elements.each do |elem|
      b << [order.id, elem.product_id] if elem.product.amountAvailable < elem.amount
    end
    b
  end


  private 

  	def order_params
  		params.require(:order).permit(:customer_id, :status)
  	end


end
