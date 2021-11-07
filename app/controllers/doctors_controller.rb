class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[ show edit update destroy ]

   # I don't want to lose any of the boiler plate stuff below in case I need it, so I'm just gonna start my code here
  def parse_info

    # open the sheet
    file = Roo::Spreadsheet.open('./Prescriber_Data.csv')
    sheet = file.sheet(0)

    # iterate over each row and store the correct information, start at row 2 to skip past headers
    last_row = sheet.last_row
    row_num = 2
    doctorList = []
    while row_num <= last_row do
        
        # save data
        doctor_id = sheet.cell(row_num, 1) 
        doctor_first_name = sheet.cell(row_num, 2)
        doctor_last_name = sheet.cell(row_num, 3)
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
        
        # This code determines if the doctor is a potential top describer. Calculates if they had a 20% increase in new prescription rate and sets the boolean accordingly
        if (nrx_month_6.to_i >= (nrx_month_1.to_i + (nrx_month_1.to_i * 0.20)).round)
            top_prescriber = true
        else   
            top_prescriber = false
        end

        total_nrx = nrx_month_1.to_i + nrx_month_2.to_i + nrx_month_3.to_i + nrx_month_4.to_i + nrx_month_5.to_i + nrx_month_6.to_i
        total_trx = total_nrx + trx_month_1.to_i + trx_month_2.to_i + trx_month_3.to_i + trx_month_4.to_i + trx_month_5.to_i + trx_month_6.to_i

        # initialize new instance of a doctor
        new_doctor = Doctor.new(
            DoctorID: doctor_id,
            FirstName: doctor_first_name,
            LastName: doctor_last_name,
            Month1NRxDoctor: nrx_month_1,
            Month2NRxDoctor: nrx_month_2,
            Month3NRxDoctor: nrx_month_3,
            Month4NRxDoctor: nrx_month_4,
            Month5NRxDoctor: nrx_month_5,
            Month6NRxDoctor: nrx_month_6,
            Month1TRxDoctor: trx_month_1,
            Month2TRxDoctor: trx_month_2,
            Month3TRxDoctor: trx_month_3,
            Month4TRxDoctor: trx_month_4,
            Month5TRxDoctor: trx_month_5,
            Month6TRxDoctor: trx_month_6,
            TotalNRxDoctor: total_nrx,
            TotalTRxDoctor: total_trx,
            DoctorsProduct: product,
            TopPrescriber: top_prescriber
        )
        
        # increment forward and add the doctor to the array
        row_num = row_num + 1
        doctorList << new_doctor
    end

    # bulk insert into database to increase speed
    Doctor.import doctorList
  end





  # ---------- We don't use this code, but we were too scared to get rid of it. ----------

  # GET /doctors or /doctors.json
  def index
    Doctor.delete_all
    parse_info
    @doctors = Doctor.all
  end

  # GET /doctors/1 or /doctors/1.json
  def show
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  # GET /doctors/1/edit
  def edit
  end

  # POST /doctors or /doctors.json
  def create
    @doctor = Doctor.new(doctor_params)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: "Doctor was successfully created." }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1 or /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: "Doctor was successfully updated." }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1 or /doctors/1.json
  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: "Doctor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def doctor_params
      params.fetch(:doctor, {})
    end
end
