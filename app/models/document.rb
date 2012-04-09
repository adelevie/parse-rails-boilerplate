class Document < ParseResource::Base
  # this should handle fetching FCC documents
  fields :name, :url, :md5
  
  def file
    # fetch the file from the url
  end
  
  def self.fetch_all
    # run this one once a day
    # => 
  end
end