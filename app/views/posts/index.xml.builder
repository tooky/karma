xml.instruct!
xml.feed :xmlns => "http://www.w3.org/2005/Atom" do |feed|
  feed.title('Karma Trading')
  feed.subtitle('by Steve Tooke')
  feed.link :href => url(:home)
  feed.link :href => url(:feed)
  feed.updated(@posts.first.updated_at) if @posts.size > 0
  for post in @posts
    feed.entry do |entry|
      entry.title(post.title)
      entry.link :href => post.permalink
      entry.updated(post.updated_at)
      entry.content(textile(post.body), :type => 'html')
    end
  end
end