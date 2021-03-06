class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pins = Pin.all
    respond_with(@pins)
  end

  def show
    respond_with(@pin)
  end

  def new
    @pin = Pin.new
    respond_with(@pin)
  end

  def edit
  end

  def create
    @pin = Pin.new(pin_params)
    flash[:notice] = 'Pin was successfully created.'if @pin.save
    respond_with(@pin)
  end

  def update
    @pin.update(pin_params)
    flash[:notice] = 'Pin was successfully updated.'if @pin.save
    respond_with(@pin)
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description)
    end
end
