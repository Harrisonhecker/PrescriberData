require 'roo' # use this gem for parsing excel files

  def parse_info

    # open the sheet
    file = Roo::Spreadsheet.open('./Prescriber_Data.csv')
    sheet = file.sheet(0)

    # iterate over each row and store the correct information, start at row 2 to skip past headers
    last_row = sheet.last_row
    row_num = 2
    productList = [] # array will contain the product objects
    productNames = [] # array will contain the names of the products
    while row_num <= last_row do
        
        # save data
        product_id = sheet.cell(row_num, 1) 
        doctor = sheet.cell(row_num, 2) + " " + sheet.cell(row_num, 3)
        state = sheet.cell(row_num, 4)
        product = sheet.cell(row_num, 5)
        nrx_month_1 = sheet.cell(row_num, 6)
        nrx_month_2 = sheet.cell(row_num, 7)
        nrx_month_3 = sheet.cell(row_num, 8)
        nrx_month_4 = sheet.cell(row_num, 9)
        nrx_month_5 = sheet.cell(row_num, 10)
        nrx_month_6 = sheet.cell(row_num, 11)
        trx_month_1 = sheet.cell(row_num, 12)
        trx_month_2 = sheet.cell(row_num, 13)
        trx_month_3 = sheet.cell(row_num, 14)
        trx_month_4 = sheet.cell(row_num, 15)
        trx_month_5 = sheet.cell(row_num, 16)
        trx_month_6 = sheet.cell(row_num, 17)
        total_nrx = nrx_month_1.to_i + nrx_month_2.to_i + nrx_month_3.to_i + nrx_month_4.to_i + nrx_month_5.to_i + nrx_month_6.to_i
        total_trx = total_nrx + trx_month_1.to_i + trx_month_2.to_i + trx_month_3.to_i + trx_month_4.to_i + trx_month_5.to_i + trx_month_6.to_i

        # if product does not exist, create it
        if (productNames.find_index(product).nil?)
            productNames << product
            new_product = Product.new(
                ProductID: product_id,
                ProductName: product,
                Month1NRxProduct: nrx_month_1.to_i,
                Month2NRxProduct: nrx_month_2.to_i,
                Month3NRxProduct: nrx_month_3.to_i,
                Month4NRxProduct: nrx_month_4.to_i,
                Month5NRxProduct: nrx_month_5.to_i,
                Month6NRxProduct: nrx_month_6.to_i,
                Month1TRxProduct: trx_month_1.to_i,
                Month2TRxProduct: trx_month_2.to_i,
                Month3TRxProduct: trx_month_3.to_i,
                Month4TRxProduct: trx_month_4.to_i,
                Month5TRxProduct: trx_month_5.to_i,
                Month6TRxProduct: trx_month_6.to_i,
                TotalNRxProduct: total_nrx,
                TotalTRxProduct: total_trx,
                TopDoctor: doctor,
                TopDoctorPrescriptions: total_trx
            )

            # add to product array
            productList << new_product
        
            # if product does exist, update values
        else 
            currentProduct = productList[productNames.find_index(product)]
            currentProduct.Month1NRxProduct += (nrx_month_1).to_i
            currentProduct.Month2NRxProduct += (nrx_month_2).to_i
            currentProduct.Month3NRxProduct += (nrx_month_3).to_i
            currentProduct.Month4NRxProduct += (nrx_month_4).to_i
            currentProduct.Month5NRxProduct += (nrx_month_5).to_i
            currentProduct.Month6NRxProduct += (nrx_month_6).to_i
            currentProduct.Month1TRxProduct += (trx_month_1).to_i
            currentProduct.Month2TRxProduct += (trx_month_2).to_i
            currentProduct.Month3TRxProduct += (trx_month_3).to_i
            currentProduct.Month4TRxProduct += (trx_month_4).to_i
            currentProduct.Month5TRxProduct += (trx_month_5).to_i
            currentProduct.Month6TRxProduct += (trx_month_6).to_i
            currentProduct.TotalNRxProduct += total_nrx
            currentProduct.TotalTRxProduct += total_trx
            
            # this code maintains which doctor has the most prescriptions for the product as well as the number of prescriptions
            if (currentProduct.TopDoctorPrescriptions < total_trx)
                currentProduct.TopDoctor = doctor
                currentProduct.TopDoctorPrescriptions = total_trx
            end
        end

        # increment forward
        row_num = row_num + 1
    end

    # bulk insert into database to increase speed 
    Product.import productList
  end




  # ---------- We don't use this code, but we were too scared to get rid of it. ----------

class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  
  # GET /products or /products.json
  def index
    Product.delete_all
    parse_info
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

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
        format.html { redirect_to @product, notice: "Product was successfully created." }
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
        format.html { redirect_to @product, notice: "Product was successfully updated." }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.fetch(:product, {})
    end
end
