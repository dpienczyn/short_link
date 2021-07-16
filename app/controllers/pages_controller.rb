class PagesController < ApplicationController
  def redirect_to_url
    link = Link.find_by!(url_digest: params[:url_digest])
    link.visited_count += 1
    link.save!
    redirect_to link.url
  end
end
