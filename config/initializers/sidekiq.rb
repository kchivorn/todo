if Rails.env.production?
  Sidekiq.configure_server do |config|
    config.redis = { url: ENV['REDISCLOUD_URL'], size: 24}
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: ENV['REDISCLOUD_URL'], size: 1}
  end

  # Rails.application.config.after_initialize do
  #   Rails.logger.info("DB Connection Pool size for Sidekiq Server before disconnect is: #{ActiveRecord::Base.connection.pool.instance_variable_get('@size')}")
  #   ActiveRecord::Base.connection_pool.disconnect!

  #   ActiveSupport.on_load(:active_record) do
  #     config = Rails.application.config.database_configuration[Rails.env]
  #     config['reaping_frequency'] = ENV['DATABASE_REAP_FREQ'] || 10 # seconds
  #     config['pool'] = ENV['WORKER_DB_POOL_SIZE'] || Sidekiq.options[:concurrency]
  #     #config['pool'] = 20
  #     ActiveRecord::Base.establish_connection(config)

  #     Rails.logger.info("DB Connection Pool size for Sidekiq Server is now: #{ActiveRecord::Base.connection.pool.instance_variable_get('@size')}")
  #   end
  # end
elsif Rails.env.development?
  Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379/5'}
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://localhost:6379/5'}
  end
end
