module User::Subscriptions
  extend ActiveSupport::Concern

  included do
    has_one :subscription
    before_create :build_subscription

    delegate :plan, :plan?, :blocked?, to: :subscriptions, prefix: true

    cattr_accessor :_has_subscription
  end

  def build_subscription
    super if subscription.blank?
  end
end