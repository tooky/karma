class Post
  include DataMapper::Resource
  before :create, :create_slug

  property :id, Integer, :serial => true
  property :title, String, :length => 255, :nullable => false
  property :body, Text, :nullable => false
  property :slug, String, :length => 255, :index => true
  property :created_at, DateTime
  property :updated_at, DateTime
  
  def permalink
    "/#{slug}"
  end
  
  private
  def create_slug
    new_slug = self.created_at.strftime("%Y/%m/%d") / escape(self.title.dup)
    attribute_set(:slug, new_slug)
  end
  
  def escape(s)
    s.gsub!(/\W+/, ' ') # all non-word chars to spaces
    s.strip!            # ohh la la
    s.downcase!         #
    s.gsub!(/\ +/, '-') # spaces to dashes, preferred separator char everywhere
    s
  end
end
