require './GenericTaxHandler'

class PhysicalProductTaxHandler < GenericTaxHandler
  attr_accessor :customer_location, :customer_type

  def initialize(customer_location, customer_type)
    @customer_location = customer_location
    @customer_type = customer_type
    @trans_type = 'good'
  end

  def compute_tax
    tax = {
      transaction_type: @trans_type
    }

    case @customer_location
    when 'ES'
      tax[:tax_rate] = 'ES_VAT'
    when 'OTHER_EU'
      if @customer_type == 'INDIVIDUAL'
        tax[:tax_rate] = 'OTHER_EU_VAT'
      else
        tax[:tax_rate] = 'NO_VAT'
        tax[:transaction_type] = 'reverse charge'
      end
    when 'OUTSIDE_EU'
      tax[:tax_rate] = 'NO_VAT'
      tax[:transaction_type] = 'export'
    else
      tax[:error] = 'No valid location was provided'
    end

    tax
  end
end