class DeliveriesController < ApplicationController
  before_action :set_delivery, only: %i[show edit update destroy]

  # GET /deliveries or /deliveries.json
  def index
    @deliveries = Delivery.all
  end

  # GET /deliveries/1 or /deliveries/1.json
  def show
    # Widok 'show' powinien działać, jeśli @delivery istnieje
    # Obsługujemy przypadek, gdy @delivery jest nil
    if @delivery.nil?
      redirect_to deliveries_url, alert: 'Zamówienie nie zostało znalezione.'
    end
  end

  # GET /deliveries/new
  def new
    @delivery = Delivery.new
  end

  # GET /deliveries/1/edit
  def edit
  end

  # POST /deliveries or /deliveries.json
  def create
    @delivery = Delivery.new(delivery_params)

    respond_to do |format|
      if @delivery.save
        format.html { redirect_to @delivery, notice: 'Zamówienie zostało utworzone.' }
        format.json { render :show, status: :created, location: @delivery }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deliveries/1 or /deliveries/1.json
  def update
    respond_to do |format|
      if @delivery.update(delivery_params)
        format.html { redirect_to @delivery, notice: 'Zamówienie zostało zaktualizowane.' }
        format.json { render :show, status: :ok, location: @delivery }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliveries/1 or /deliveries/1.json
  def destroy
    begin
      @delivery.destroy!
      respond_to do |format|
        format.html { redirect_to deliveries_url, notice: 'Zamówienie zostało usunięte.' }
        format.json { head :no_content }
      end
    rescue ActiveRecord::RecordNotDestroyed => e
      respond_to do |format|
        format.html { redirect_to deliveries_url, alert: 'Wystąpił błąd podczas usuwania zamówienia.' }
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_delivery
    @delivery = Delivery.find_by(id: params[:id])

    if @delivery.nil?
      redirect_to deliveries_url, alert: 'Zamówienie nie zostało znalezione.'
    end
  end

  # Only allow a list of trusted parameters through.
  def delivery_params
    params.require(:delivery).permit(:product_id, :quantity, :order_date)
  end
end
