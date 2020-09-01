class Admin::ProductsController < ApplicationController
    before_action :restrict_unless_admin
  
    def index
      @products = Product.all
    end
  
    def show
      @product = Product.find(params[:id])
    end
  
    def new
      @product = Product.new
    end
  
    def edit
      @product = Product.find(params[:id])
    end
  
    def create
      @product = Product.new(product_params)
  
      respond_to do |format|
        if @product.save
          format.html { redirect_to [:admin, @product], notice: 'Product was successfully created.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      @product = Product.find(params[:id])
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to [:admin, @product], notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      respond_to do |format|
        format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
  
      def product_params
        params.require(:product).permit(:name)
      end
      
  end