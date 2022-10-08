class CartsController < ApplicationController
    def index 
        @cart=Cart.all
        @warehouse=Warehouse.all
    end 

    def update
        @cart=Cart.find(params[:id])
        @quantity=params[:cart][:quantity]
        @cart.quantity=@quantity
        respond_to do |format|
            if @cart.save
              format.html { redirect_to carts_path, notice: "cart was updated" }
            end
        end
    end 

end
