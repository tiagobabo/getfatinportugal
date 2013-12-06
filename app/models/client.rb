class Client < ActiveRecord::Base
  belongs_to :client_type
  belongs_to :country
  has_many :client_product
  has_many :products, :through => :client_product

  attr_accessible :address, :email, :location, :mobile_phone, :name, :nif, :person_in_charge, :phone, :postal_code, :client_type_id, :country_id, :motto


  def create_client_with_products_and_payment_plan (params, client)
    transaction do
      if !params[:products].nil?
        if params[:products].count>0
          params[:products].each do |product_id|
            client.client_product.build(:product_id => product_id, :position => 1, :created_at => Time.now)
          end
        end
      end

      client.save

      if !params[:modality_select].nil?
        @service_modality = ServiceModality.where(name: params[:modality_select]).first     

        initial_date = params[:date_begin].empty? ? DateTime.parse(params[:date_begin_time]) : DateTime.parse(params[:date_begin])
        end_date = params[:date_end_time].empty? ? nil : DateTime.parse(params[:date_end_time])

        @payment_plan = PaymentPlan.new(:balance => params[:quantity], :initial_date => initial_date, :end_date => end_date, :client_id => client.id, :service_modality_id => @service_modality.id)
        @payment_plan.save

      end
      return true
    end

  end

  def get_clients_for_product_with_active_plan(product_id)
    @clients = Client.joins("inner join payment_plans as pp on pp.client_id=clients.id
    inner join client_products as cp on cp.client_id=clients.id")
    .where("cp.product_id = ? and pp.balance >0 and pp.initial_date >= ?",product_id, Time.now)

  end

end
