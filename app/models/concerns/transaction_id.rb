module TransactionId
  def self.generator
    SecureRandom.base64.tr('+/=', 'Qrt')
  end
end
