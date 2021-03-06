module Paperclip
  class Attachment
    class << self
      alias_method :origin_default_options, :default_options
      def default_options
        options = origin_default_options.deep_merge({
          default_url: '/defaults/:attachment/:style.png'
        })
        if configatron.aws.enabled
          options.deep_merge!({
            storage:      :s3,
            url:          "uploads/#{Rails.env.first}/:class/:attachment/:id_partition/:style/:filename",
            path:         "uploads/#{Rails.env.first}/:class/:attachment/:id_partition/:style/:filename",
            bucket:       configatron.aws.bucket,
            s3_credentials: {
              access_key_id: configatron.aws.access_key,
              secret_access_key: configatron.aws.secret_key,
            }
          })
        end
        options
      end
    end
  end
end