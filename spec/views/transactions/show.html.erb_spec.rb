require 'rails_helper'

RSpec.describe "transactions/show", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      payer: "Payer",
      points: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Payer/)
    expect(rendered).to match(/2/)
  end
end
