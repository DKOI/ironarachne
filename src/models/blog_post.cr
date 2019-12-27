require "json"

class BlogResponse
  JSON.mapping(
    code: Int32,
    data: BlogData,
  )
end

class BlogData
  JSON.mapping(
    alias: String,
    title: String,
    description: String,
    style_sheet: String,
    public: Bool,
    format: String,
    views: Int32,
    url: String,
    total_posts: Int32,
    posts: Array(BlogPost),
  )
end

class BlogPost
  JSON.mapping(
    id: String,
    slug: String,
    appearance: String,
    language: String,
    rtl: Bool,
    created: String,
    updated: String,
    title: String,
    body: String,
    tags: Array(String),
    views: Int32,
  )
end
