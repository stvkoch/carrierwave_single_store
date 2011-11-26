class ImageUploader < CarrierWave::Uploader::SingleStore::Base

  # Include RMagick or ImageScience support:
  include CarrierWave::RMagick
  
  #CarrierWave::Uploader::SingleStore::Base add and overide methods on CarrierWave plugin---{{{
  
  # storage :file
  
  # -->this is very important: Verify if exist some record on table, if exist, not remove file!
  # before :remove, :check_if_not_exist

  # def check_if_not_exist
  #   if( !model.send("#{mounted_as}_identifier").nil? && model.class.where("#{mounted_as}=?", model.send("#{mounted_as}_identifier") ).count>0 )
  #     model.send("remove_#{mounted_as}=", false)
  #   end
  # end

  # --> you can overide this method in you uploader file, add your store path, but important part are single_store_dir that return single store location for your file and record
  # def store_dir
  #   "uploads/#{single_store_dir}"
  # end
  
  # def filename
  #   if super
  #     @name ||= "#{md5}#{File.extname(super)}"
  #   end
  # end

  # private
  # def md5
  #   chunk = model.image
  #   @md5 ||= Digest::MD5.hexdigest(chunk.read)
  # end

  # #@example: product/image/A3/45/97/A34597....jpg
  # def single_store_dir
  #   data_column = model.send("#{mounted_as}_identifier")
  #   "#{model.class.to_s.underscore}/#{mounted_as}/#{data_column[0..1]}/#{data_column[2..3]}/#{data_column[4..5]}"
  # end

  #---}}}


  version :small do
    process :resize_to_limit => [100, 100]
  end
  
  version :medium do
    process :resize_to_limit => [280, 280]
  end

  process :resize_to_limit => [480, 480]

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
