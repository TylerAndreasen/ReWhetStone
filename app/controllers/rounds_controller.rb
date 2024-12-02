class RoundsController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ] # Added at the advise of ChatGPT 4o mini
  before_action :set_round, only: %i[ show edit update destroy ]

  # GET /rounds or /rounds.json
  def index
    @rounds = Round.all
  end

  # GET /rounds/1 or /rounds/1.json
  def show
  end

  # GET /rounds/new
  def new
    @round = @player.round.build # Modified at the advise of ChatGPT 4o mini
  end

  # GET /rounds/1/edit
  def edit
  end

  # POST /rounds or /rounds.json
  def create
    @round = @player.round.build(round_params) # Modified at the advise of ChatGPT 4o mini 

    respond_to do |format|
      if @round.save
        format.html { redirect_to @player, notice: "Your round was successfully submitted. Keep up the good work!" }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rounds/1 or /rounds/1.json
  def update
    respond_to do |format|
      if @round.update(round_params)
        format.html { redirect_to @player, notice: "You round was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1 or /rounds/1.json
  def destroy
    @round.destroy!

    respond_to do |format|
      format.html { redirect_to @player, status: :see_other, notice: "Your round was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    def set_player # Added at the advise of ChatGPT 4o mini
      @player = Player.find(params[:player_id])
    end

    # Only allow a list of trusted parameters through.
    def round_params
      params.require(:round).permit(:player_id, :score_1, :score_2, :score_3, :score_4, :called_clutch, :score_5)
    end
end
