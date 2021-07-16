class LinkSerializer
  include FastJsonapi::ObjectSerializer

  attributes :url, :url_digest, :visited_count
end
