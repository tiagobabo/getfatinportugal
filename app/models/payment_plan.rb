class PaymentPlan < ActiveRecord::Base
  belongs_to :client
  belongs_to :service_modality
  attr_accessible :balance, :end_date, :initial_date, :client_id, :service_modality_id
end
