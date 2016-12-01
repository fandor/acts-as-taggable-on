module ActsAsTaggableOn
  module DbConnection
    extend ActiveSupport::Concern

    module ClassMethods
      attr_accessor :class_db_connection

      def establish_tagging_database_connection
        unless Rails.env == 'test'
          db_config = Rails.root.join("config", "acts_as_taggable_on_database.yml")
          if File.exist?(db_config)
            ## alternate DB Connection
            class_db_connection = YAML.load_file(db_config)[Rails.env]
            establish_connection class_db_connection
          end
        end
      end
    end

  end
end