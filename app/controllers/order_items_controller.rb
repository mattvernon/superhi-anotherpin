class OrderItemsController < ApplicationController

  def create

    # find the product
    @product = Product.find(params[:product_id])

    # quantity comes from form data
    @quantity = form_params[:quantity]

    # add it to cart
    @current_cart.order_items.create(product: @product, quantity: @quantity)

    flash[:success] = "Thanks for adding to your cart!"

    redirect_to cart_path
  end

  def update
    @product = Product.find_by(params[:product_id])

    @order_item = OrderItem.find_by(params[:id])

    @order_item.update(form_params)

    flash[:success] = "Thanks for updating your cart!"

    redirect_to cart_path
  end

  def destroy
    @product = Product.find(params[:product_id])
    @order_item = OrderItem.find(params[:id])

    @order_item.delete

    flash[:success] = "Product removed from Cart"

    redirect_to cart_path
  end

  def form_params
    params.require(:order_item).permit(:quantity)
  end

end