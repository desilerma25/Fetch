class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions or /transactions.json
  # gets payer balances
  def index
    @transactions = Transaction.payer_bal
    render json: @transactions
  end


  # POST /transactions or /transactions.json
  # adds new transactions
  def create_t
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # spends points
  def spend_pts
    @spent = Transaction.spend_points(spend)

    render json: @spent
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:payer, :points, :date)
    end
end
