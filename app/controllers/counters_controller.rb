class CountersController < ApplicationController
  before_action :set_counter, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def ajax
    puts "AJAX is here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts params[:year]
    @counters = Counter.by_year(params[:year])
    puts @counters
    table_head = '''
      <table class="table-hover table-condensed table-bordered">
        <thead>
          <tr>
            <th> Дата </th>
            <th> Газ </th>
            <th> Хол. вода </th>
            <th> Гор. вода </th>
            <th> Отвод гор. воды </th>
            <th> Электричество </th>
            <th> Отопление</th>
            <th> Телефон </th>
            <th> Спикерфон </th>
            <th> Очистка </th>
            <th> Всего </th>
            <th colspan="2"></th>
          </tr>
        </thead>
      <tbody>
    '''
    @counters.each do |counter|
      results = counter.get_calculated
      table_head += "<tr>"+"<td>"+results[:gas].to_s+"</td></tr></tbody>" 
    end  
    render :text => table_head  
  end

  # GET /counters
  # GET /counters.json
  def index
    @counters = Counter.last(5)
  end

  # GET /counters/1
  # GET /counters/1.json
  def show
  end

  # GET /counters/new
  def new
    @counter = Counter.new
    @last_tariff = Tariff.last()
    @counter.tariff_id = @last_tariff.id
    @counter.save()
  end

  # GET /counters/1/edit
  def edit
    @last_tariff = Tariff.last()
    @counter.tariff_id = @last_tariff.id
  end

  # POST /counters
  # POST /counters.json
  def create
    @counter = Counter.new(counter_params)

    respond_to do |format|
      if @counter.save
        format.html { redirect_to @counter, notice: 'Counter was successfully created.' }
        format.json { render :show, status: :created, location: @counter }
      else
        format.html { render :new }
        format.json { render json: @counter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /counters/1
  # PATCH/PUT /counters/1.json
  def update
    respond_to do |format|
      if @counter.update(counter_params)
        format.html { redirect_to @counter, notice: 'Counter was successfully updated.' }
        format.json { render :show, status: :ok, location: @counter }
      else
        format.html { render :edit }
        format.json { render json: @counter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /counters/1
  # DELETE /counters/1.json
  def destroy
    @counter.destroy
    respond_to do |format|
      format.html { redirect_to counters_url, notice: 'Counter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_counter
      @counter = Counter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def counter_params
      params.require(:counter).permit(:date, :heat, :phone, :cleaning, :speaker, :gas, :cold_water, :hot_water, :electricity, :comment, :belongs_to, :tariff_id)
    end
end
