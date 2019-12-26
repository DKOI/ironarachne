require "crinja"
require "orion"

class RegionController
  include Orion::ControllerHelper

  def index
    data = {"page" => { "title" => "Regions"}}
    view = render_html("regions/index.html.j2", data, context)
  end
end
