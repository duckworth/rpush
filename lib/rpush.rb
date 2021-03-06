require 'active_model'
require 'multi_json'

require 'rpush/version'
require 'rpush/deprecation'
require 'rpush/deprecatable'
require 'rpush/logger'
require 'rpush/multi_json_helper'
require 'rpush/reflection'

module Rpush
  def self.init_orm
    require 'rpush/notification'
    require 'rpush/app'

    require 'rpush/apns/binary_notification_validator'
    require 'rpush/apns/device_token_format_validator'
    require 'rpush/apns/notification'
    require 'rpush/apns/feedback'
    require 'rpush/apns/app'

    require 'rpush/gcm/expiry_collapse_key_mutual_inclusion_validator'
    require 'rpush/gcm/notification'
    require 'rpush/gcm/app'

    require 'rpush/wpns/notification'
    require 'rpush/wpns/app'

    require 'rpush/adm/data_validator'
    require 'rpush/adm/notification'
    require 'rpush/adm/app'
  end

  def self.attr_accessible_available?
    require 'rails'
    ::Rails::VERSION::STRING < '4'
  end

  require 'rpush/railtie' if defined?(Rails)
end

require 'rpush/configuration'
require 'rpush/embed'
require 'rpush/push'
require 'rpush/apns_feedback'
require 'rpush/notifier'
require 'rpush/payload_data_size_validator'
require 'rpush/registration_ids_count_validator'

module Rpush
  def self.jruby?
    defined? JRUBY_VERSION
  end

  def self.require_for_daemon
    require 'rpush/daemon'
  end

  def self.logger
    @logger ||= Logger.new(:foreground => Rpush.config.foreground)
  end

  def self.logger=(logger)
    @logger = logger
  end
end
