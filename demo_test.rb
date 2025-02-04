require 'minitest/autorun'
require_relative './PhysicalProductTaxHandler'
require_relative './DigitalServicesTaxHandler'
require_relative './OnSiteServicesTaxHandler'

class PhysicalProductTaxHandlerTest < Minitest::Test
  def test_business_physicalgoods_othereu
    obj_physical_good = PhysicalProductTaxHandler.new('OTHER_EU', 'BUSINESS')
    taxData = obj_physical_good.compute_tax

    assert_equal(taxData[:tax_rate], 'NO_VAT')
    assert_equal(taxData[:transaction_type], 'reverse charge')
  end

  def test_individual_physicalgoods_othereu
    obj_physical_good = PhysicalProductTaxHandler.new('OTHER_EU', 'INDIVIDUAL')
    taxData = obj_physical_good.compute_tax

    assert_equal(taxData[:tax_rate], 'OTHER_EU_VAT')
    assert_equal(taxData[:transaction_type], 'good')
  end

  def test_physicalgoods_outsideeu
    obj_physical_good = PhysicalProductTaxHandler.new('OUTSIDE_EU', 'INDIVIDUAL')
    taxData = obj_physical_good.compute_tax

    assert_equal(taxData[:tax_rate], 'NO_VAT')
    assert_equal(taxData[:transaction_type], 'export')
  end
end

class DigitalServicesTaxHandlerTest < Minitest::Test
  def test_business_digitalservices_othereu
    obj_digitalservices = DigitalServicesTaxHandler.new('OTHER_EU', 'BUSINESS')
    taxData = obj_digitalservices.compute_tax

    assert_equal(taxData[:tax_rate], 'NO_VAT')
    assert_equal(taxData[:transaction_type], 'reverse charge')
  end

  def test_individual_digitalservices_othereu
    obj_digitalservices = DigitalServicesTaxHandler.new('OTHER_EU', 'INDIVIDUAL')
    taxData = obj_digitalservices.compute_tax

    assert_equal(taxData[:tax_rate], 'OTHER_EU_VAT')
    assert_equal(taxData[:transaction_type], 'service and digital')
  end

  def test_digitalservices_outsideeu
    obj_digitalservices = DigitalServicesTaxHandler.new('OUTSIDE_EU', 'INDIVIDUAL')
    taxData = obj_digitalservices.compute_tax

    assert_equal(taxData[:tax_rate], 'NO_VAT')
  end
end

class OnSiteServicesTaxHandlerTest < Minitest::Test
  def test_onsiteservices
    obj_onsiteservices = OnSiteServicesTaxHandler.new
    taxData = obj_onsiteservices.compute_tax

    assert_equal(taxData[:tax_rate], 'ES_VAT')
    assert_equal(taxData[:transaction_type], 'service and onsite')
  end
end