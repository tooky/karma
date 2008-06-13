class Post < ActiveRecord::Base
  # include DataMapper::Resource
  before_create :create_slug
  
  def permalink
    "/#{slug}"
  end
  
  private
  def create_slug
    self.slug = self.created_at.strftime("%Y/%m/%d") / escape(self.title.dup)
  end
  
  def escape(s)
    s.gsub!(/\W+/, ' ') # all non-word chars to spaces
    s.strip!            # ohh la la
    s.downcase!         #
    s.gsub!(/\ +/, '-') # spaces to dashes, preferred separator char everywhere
    s
  end
end
