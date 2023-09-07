class Api::V1::ProductsController < ApplicationController

  # GET ALL PRODUCTS

  def index
    products = Product.all
    render json: products, status: 200
  end


  # FOR SHOW  THE PRODUCT 

  def show
    product = Product.find_by(id: params[:id])
    if product
      render json: product, status: 200
    else
      render json: { error: "not Found" }, status: 404
    end
  end




# FOR CREATE THE PRODUCT

def create
  product = Product.new(
    name: prod_params[:name],
    brand: prod_params[:brand],
    price: prod_params[:price]
  )

  if product.save
    render json: { message: "Product created successfully", product: product }, status: 200
  else
    render json: { error: "Failed to create" }, status: 404
  end
end

# FOR UPDATE THE PRODUCT

def update
  product = Product.find_by(id: params[:id])

  if product
    if product.update(prod_params)
      render json: { message: "Product updated successfully", product: product }, status: 200
    else
      render json: { error: "Failed to update" }, status: 404
    end
  else
    render json: { error: "Not Found" }, status: 404
  end
end



    # FOR DELETE  THE PRODUCT 

  def destroy
    product = Product.find_by(id: params[:id])

    if product
      if product.destroy
        render json: { message: "Product deleted successfully" }, status: 200
      else
        render json: { error: "failed to delete" }, status: 404
      end
    else
      render json: { error: "not Found" }, status: 404
    end
  end


  private
  def prod_params
    params.require(:product).permit(:name, :brand, :price)
  end
end

