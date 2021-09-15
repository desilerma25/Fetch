class TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @transactions = Transaction.payer_bal
    render json: @transactions
  end


  def create_t
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end


  def spend_pts
    @spent = Transaction.spend_points(params[:points].to_i)
    render json: @spent, status: :created
  end


  private
    
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def transaction_params
      params.require(:transaction).permit(:payer, :points, :date)
    end

end
