module ActsAsTaggableOn
  module DbConnection
    extend ActiveSupport::Concern

    module ClassMethods
      attr_accessor :class_db_connection

      def establish_tagging_database_connection
        unless Rails.env == 'test'
          if File.exist? "#{Rails.root}/config/acts_as_taggable_on_database.yml"
            ## Matinee DB Connection
            class_db_connection = YAML.load_file("#{Rails.root.to_s}/config/acts_as_taggable_on_database.yml")[Rails.env]
            #Rails.logger.debug "** Establishing connection to acts_as_taggable_on_database"
            establish_connection class_db_connection
          end
        end
      end
    end

  end
end