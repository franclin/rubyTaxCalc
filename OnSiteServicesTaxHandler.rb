require './GenericTaxHandler'

# This class encapsulates the tax computation of the  on site services.
# It yields the applicable tax data which in this case will be ES_VAT
class OnSiteServicesTaxHandler < GenericTaxHandler
  def compute_tax
    {
      transaction_type: 'service and onsite',
      tax_rate: 'ES_VAT'
    }
  end
end