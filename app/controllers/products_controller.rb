class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: 'Produkt został utworzony.'
    else
      render :new
    end
  end

  # GET /products/1/edit
  def edit
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: 'Produkt został zaktualizowany.'
    else
      render :edit
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    redirect_to root_path, notice: 'Produkt został usunięty.'
  end

  private
  # Set product by ID
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters
  def product_params
    params.require(:product).permit(:name, :quantity, :user_id, category_ids: [])
  end
end
