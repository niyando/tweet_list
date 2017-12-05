module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_compile
    current_user ? new_compilation_path : twitter_auth_url(new_compilation_url)
  end

  def twitter_auth_url(url = nil)
    redirect_url = url || request.original_url
    "/auth/twitter/?redirect_to=" + CGI.escape(redirect_url)
  end

  def tweet_intent(c)
    "https://twitter.com/intent/tweet?text=#{CGI.escape(c.title)}&url=#{CGI.escape(compilation_url(c))}&via=titoree_tweets"
  end

  def fb_intent(c)
    "https://www.facebook.com/sharer/sharer.php?u=#{CGI.escape(compilation_url(c))}"
  end

end
