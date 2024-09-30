require 'logger'

class LoggerService
  def initialize
    @logger = Logger.new('security.log')
  end

  def log(message)
    @logger.info("#{Time.now}: #{message}")
  end
end
