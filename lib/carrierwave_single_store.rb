module CarrierWave
  module Uploader
    module SingleStore
      class Base < CarrierWave::Uploader::Base

        storage :file
        before :remove, :check_if_not_exist

        def check_if_not_exist
          if( model.send("#{mounted_as}").file  && model.class.where("#{mounted_as}=?", model.send("#{mounted_as}").file.filename).count>0 )
            raise CarrierWave::Uploader::Exceptions::NotRemoveFile, 'Not remove'  
          end
        end


        def store_dir
          "uploads/#{single_store_dir}"
        end
        

        def filename
          if super
            @name ||= "#{md5}#{File.extname(super)}"
          end
        end

        private
        def md5
          chunk = model.send("#{mounted_as}")
          @md5 ||= Digest::MD5.hexdigest(chunk.read)
        end

        #@example: product/image/A3/45/97/A34597....jpg
        def single_store_dir
          data_column = model.send("#{mounted_as}_identifier")
          "#{mounted_as}/#{data_column[0..1]}/#{data_column[2..3]}/#{data_column[4..5]}"
        end

      end
    end
  end
end
