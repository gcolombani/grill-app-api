class BarbecuesController < ApplicationController
  before_action :set_barbecue, only: [:show, :update, :destroy]

  # GET /barbecues
  def index
    @barbecues = Barbecue.all

    render json: @barbecues.as_json(Barbecue.json_options)
  end

  # GET /barbecues
  def my_index
    @barbecues = Barbecue.all.where owner: current_user
    render json: @barbecues.as_json(Barbecue.json_options)
  end

  # GET /barbecues/1
  def show
    render json: @barbecue.as_json(Barbecue.json_options)
  end

  # POST /barbecues
  def create
    @barbecue = Barbecue.new(barbecue_params)
    @barbecue.owner = current_user

    if @barbecue.save
      render json: @barbecue.as_json(Barbecue.json_options),
      status: :created, location: @barbecue
    else
      render json: @barbecue.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /barbecues/1
  def update
    if @barbecue.update(barbecue_params)
      render json: @barbecue.as_json(Barbecue.json_options)
    else
      render json: @barbecue.errors, status: :unprocessable_entity
    end
  end

  # DELETE /barbecues/1
  def destroy
    @barbecue.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barbecue
      @barbecue = Barbecue.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def barbecue_params
      params.require(:barbecue).permit(:model, :description)
    end
end
