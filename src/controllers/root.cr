require "crinja"
require "orion"

class RootController
  include Orion::ControllerHelper

  def index
    data = {"page" => { "title" => "Iron Arachne"}}
    view = render_html("index.html.j2", data, context)
  end
end
