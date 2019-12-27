require "crinja"
require "orion"
require "http/client"
require "json"
require "markd"
require "../models/blog_post.cr"

class RootController
  include Orion::ControllerHelper

  def index
    response = HTTP::Client.get "https://blog.ironarachne.com/api/collections/ben/posts"

    blog_response = BlogResponse.from_json(response.body)

    posts = Array(Hash(String, String)).new

    blog_response.data.posts.each do |p|
      body_html = Markd.to_html(p.body)
      n = {"title" => p.title, "body" => body_html, "published" => p.created}
      posts << n
    end

    data = {"page" => { "title" => "Iron Arachne"}, "posts" => posts}
    render_html("index.html.j2", data, context)
  end
end
