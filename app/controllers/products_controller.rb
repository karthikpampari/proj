class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # def buy_products
  #   @product = Product.find(params[:id])
  #   @buy_product=current_user.products.create(@product)
  # end 
    
  # GET /products/new
  def new
      @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def buy_product
    @product = Product.find(params[:id])    
    if(@product.pcount_war>0)
      @count=0
      current_user.products.each do |i|
        if(i[:id]==@product[:id])
          i[:pcount_cus]+=1
          i[:pcount_war]-=1
          i.save
          @count=1
        end 
      end 
      if(@count==0)
        current_user.products << @product
        @product[:pcount_cus]+=1
        @product.save
      end
      respond_to do |format|
        format.html {redirect_to myproducts_path, notice: "Car successfully buyed." }
      end

    else 
      respond_to do |format|
        format.html { redirect_to products_path, notice: "the #{@product.name} product is not available" }
      end
       
    end 


    

  end 

  def myproducts
    @products=current_user.products
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
