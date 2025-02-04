require './GenericTaxHandler'
class OnSiteServicesTaxHandler < GenericTaxHandler
  def compute_tax
    {
      transaction_type: 'service and onsite',
      tax_rate: 'ES_VAT'
    }
  end
end