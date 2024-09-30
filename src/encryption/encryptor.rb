require 'openssl'
require 'base64'

class Encryptor
  def initialize(key)
    @key = key
    @cipher = OpenSSL::Cipher.new('AES-256-CBC')
  end

  def encrypt(plain_text)
    @cipher.encrypt
    @cipher.key = @key
    iv = @cipher.random_iv
    @cipher.iv = iv
    encrypted = @cipher.update(plain_text) + @cipher.final
    Base64.encode64(iv + encrypted)
  end

  def decrypt(encrypted_text)
    data = Base64.decode64(encrypted_text)
    iv = data[0..15]
    encrypted = data[16..-1]
    @cipher.decrypt
    @cipher.key = @key
    @cipher.iv = iv
    @cipher.update(encrypted) + @cipher.final
  end
end
