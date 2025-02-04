class GenericTaxHandler
  def compute_tax
    raise NotImplementedError, 'You must implement the compute_tax method'
  end
end