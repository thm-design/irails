class Invoice 
  include Mongoid::Document
  include Mongoid::Timestamps

  field :card_number, type: String, default: configatron.subscription.default_plan
  field :status,      type: String
  field :invoice_uid, type: String
  field :charge_uid,  type: String
  field :card_type,   type: String

  field :stripe_attributes, type: Hash

  field :attemp_count, type: Integer
  field :amount,       type: Integer

  field :billed_at, type: Time

  index({ invoice_uid: 1 }, { unique: true, background: true })
  index({ status: 1 }, { unique: true, background: true })

  belongs_to :subscription

  def amount_in_dollars
    (amount / 100).to_i
  end

  def stripe_charge
    @stripe_charge ||= Stripe::Charge.retrieve(charge_uid)
  end
end
