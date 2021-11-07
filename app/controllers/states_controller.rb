class StatesController < ApplicationController
  before_action :set_state, only: %i[ show edit update destroy ]

  def parse_info

    # open the sheet
    file = Roo::Spreadsheet.open('./Prescriber_Data.csv')
    sheet = file.sheet(0)

    # iterate over each row and store the correct information, start at row 2 to skip past headers
    last_row = sheet.last_row
    row_num = 2
    stateList = [] # array will contain the state objects
    stateNames = [] # array will contain the names of the states
    while row_num <= last_row do
        
        # save data
        state_id = sheet.cell(row_num, 1)
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

        # if state does not exist, create it
        if (stateNames.find_index(state).nil?) # if the state's name has already been put into this array, it's been initialized
            stateNames << state
            new_state = State.new(
                StateID: state_id,
                StateName: state,
                Month1NRxState: nrx_month_1.to_i,
                Month2NRxState: nrx_month_2.to_i,
                Month3NRxState: nrx_month_3.to_i,
                Month4NRxState: nrx_month_4.to_i,
                Month5NRxState: nrx_month_5.to_i,
                Month6NRxState: nrx_month_6.to_i,
                Month1TRxState: trx_month_1.to_i,
                Month2TRxState: trx_month_2.to_i,
                Month3TRxState: trx_month_3.to_i,
                Month4TRxState: trx_month_4.to_i,
                Month5TRxState: trx_month_5.to_i,
                Month6TRxState: trx_month_6.to_i,
                TotalNRxState: total_nrx,
                TotalTRxState: total_trx
            )
            
            # add to state array
            stateList << new_state
        
            # if state does exist, update values
        else 
            currentState = stateList[stateNames.find_index(state)]
            currentState.Month1NRxState += (nrx_month_1).to_i
            currentState.Month2NRxState += (nrx_month_2).to_i
            currentState.Month3NRxState += (nrx_month_3).to_i
            currentState.Month4NRxState += (nrx_month_4).to_i
            currentState.Month5NRxState += (nrx_month_5).to_i
            currentState.Month6NRxState += (nrx_month_6).to_i
            currentState.Month1TRxState += (trx_month_1).to_i
            currentState.Month2TRxState += (trx_month_2).to_i
            currentState.Month3TRxState += (trx_month_3).to_i
            currentState.Month4TRxState += (trx_month_4).to_i
            currentState.Month5TRxState += (trx_month_5).to_i
            currentState.Month6TRxState += (trx_month_6).to_i
            currentState.TotalNRxState += total_nrx
            currentState.TotalTRxState += total_trx
        end

        # increment forward
        row_num = row_num + 1
    end

    # bulk insert into database to increase speed
    State.import stateList
  end


  # ---------- We don't use this code, but we were too scared to get rid of it. ----------

  # GET /states or /states.json
  def index
    State.delete_all
    parse_info
    @states = State.all
  end

  # GET /states/1 or /states/1.json
  def show
  end

  # GET /states/new
  def new
    @state = State.new
  end

  # GET /states/1/edit
  def edit
  end

  # POST /states or /states.json
  def create
    @state = State.new(state_params)

    respond_to do |format|
      if @state.save
        format.html { redirect_to @state, notice: "State was successfully created." }
        format.json { render :show, status: :created, location: @state }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /states/1 or /states/1.json
  def update
    respond_to do |format|
      if @state.update(state_params)
        format.html { redirect_to @state, notice: "State was successfully updated." }
        format.json { render :show, status: :ok, location: @state }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /states/1 or /states/1.json
  def destroy
    @state.destroy
    respond_to do |format|
      format.html { redirect_to states_url, notice: "State was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def state_params
      params.fetch(:state, {})
    end
end
