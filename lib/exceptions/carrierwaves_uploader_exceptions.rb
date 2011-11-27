module CarrierWave
	module Uploader
		module Exceptions
			class Base < Exception
			end
			class NotRemoveFile < CarrierWave::Uploader::Exceptions::Base
			end
			class NotProcessing < CarrierWave::Uploader::Exceptions::Base
			end
		end #Exceptions
	end
end