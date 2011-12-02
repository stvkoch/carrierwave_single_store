# encoding: utf-8
module CarrierWave
  module Uploader
    module Callbacks
      extend ActiveSupport::Concern

      def with_callbacks(kind, *args)
        begin
          self.class._before_callbacks[kind].each { |c| send c, *args }
          yield
        rescue CarrierWave::Uploader::Exceptions::Base
        end
        self.class._after_callbacks[kind].each { |c| send c, *args }
      end

    end # Callbacks
  end # Uploader
end # CarrierWave
