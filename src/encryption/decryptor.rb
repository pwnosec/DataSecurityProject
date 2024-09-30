# Note: This file is not strictly necessary since the decrypt method is already in encryptor.rb
# but included for clarity.

require_relative 'encryptor'

class Decryptor
  def initialize(key)
    @encryptor = Encryptor.new(key)
  end

  def decrypt(encrypted_text)
    @encryptor.decrypt(encrypted_text)
  end
end
