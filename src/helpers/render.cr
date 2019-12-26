def render_html(file_name, data, context)
  env = Crinja.new
  env.loader = Crinja::Loader::FileSystemLoader.new("views/")

  template = env.get_template(file_name)
  view = template.render(data)

  context.response.content_type = "text/html"
  context.response.print view
end
