class OrderElementsController < ApplicationController

	def edit
		@orderElement = OrderElement.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def update
		@orderElement = OrderElement.find(params[:id])
		respond_to do |format|
			if @orderElement.update(order_element_params)
				@orderSum = OrdersController.calculateTotal(@orderElement.order)
				@elementSum = @orderElement.amount * @orderElement.product.price
				format.js
			else
				format.js
			end
		end
	end

	def destroy
		@orderElement = OrderElement.find(params[:id])
		@elementCost = @orderElement.amount * @orderElement.product.price;
		@orderElement.destroy
		respond_to do |format|
			#msg = {:status => 'ok'}
			#format.json {render :json => msg}
			format.js
		end
	end

	private 

		def order_element_params
			params.require(:order_element).permit(:amount, :customer_id, :order_id);
		end

end