require_relative 'encryption/encryptor'
require_relative 'authentication/auth_service'
require_relative 'monitoring/logger'
require_relative 'monitoring/alert_system'

# Sample usage
key = OpenSSL::Digest::SHA256.digest('your-secret-key')
encryptor = Encryptor.new(key)
auth_service = AuthService.new
logger = LoggerService.new
alert_system = AlertSystem.new

# User Registration
puts auth_service.register('user1', 'password123')

# User Login
login_response = auth_service.login('user1', 'password123')
puts login_response
logger.log(login_response)

# Encrypt and Decrypt Data
plain_text = "Sensitive Data"
encrypted_data = encryptor.encrypt(plain_text)
puts "Encrypted: #{encrypted_data}"

decrypted_data = encryptor.decrypt(encrypted_data)
puts "Decrypted: #{decrypted_data}"

# Logging an event
logger.log("User 'user1' logged in.")

# Send an alert
alert_system.send_alert("User 'user1' has logged in.")
