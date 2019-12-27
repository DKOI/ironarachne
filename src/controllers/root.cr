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
      publish_time = Time.parse(p.created, "%Y-%m-%dT%H:%M:%SZ", Time::Location.load("America/Chicago"))
      published_at = publish_time.to_s("%b %-d, %Y at %l:%M %p")
      n = {"title" => p.title, "body" => body_html, "published" => published_at}
      posts << n
    end

    data = {"page" => { "title" => "Iron Arachne"}, "posts" => posts}
    render_html("index.html.j2", data, context)
  end
end
