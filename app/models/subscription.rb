class Subscription < ActiveRecord::Base
  belongs_to :user
  attr_accessible :stripe_customer_token
  
  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description:user, card:stripe_customer_token)
      self.stripe_customer_token = customer.id
      save!
    end
      rescue Stripe::InvalidRequestError => e
        logger.error "Stripe error while creating customer: #{e.mesage}"
        errors.add :base, "There was a problem with your credit card."
        false
  end
  
end
