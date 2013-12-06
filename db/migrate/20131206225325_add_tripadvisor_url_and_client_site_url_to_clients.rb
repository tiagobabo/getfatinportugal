class AddTripadvisorUrlAndClientSiteUrlToClients < ActiveRecord::Migration
  def change
    add_column :clients, :tripadvisor_url, :string
    add_column :clients, :client_site_url, :string
  end
end
