class PagesController < ApplicationController

  # This action is usually accessed with the root path, normally '/'
  def home
    error_404 unless (@page = Page.where(:link_url => '/').first).present?
  end

  # This action can be accessed normally, or as nested pages.
  # Assuming a page named "mission" that is a child of "about",
  # you can access the pages with the following URLs:
  #
  #   GET /pages/about
  #   GET /about
  #
  #   GET /pages/mission
  #   GET /about/mission
  #
  def show
    @page = Page.find("#{params[:path]}/#{params[:id]}".split('/').last)

    if @page.try(:live?) || (refinery_user? && current_user.authorized_plugins.include?("refinery_pages"))
      # if the admin wants this to be a "placeholder" page which goes to its first child, go to that instead.
      if @page.skip_to_first_child && (first_live_child = @page.children.order('lft ASC').where(:draft=>false).first).present?
        redirect_to first_live_child.url
      elsif @page.link_url.present?
        redirect_to @page.link_url and return
      end
      render_custom_page_template
    else
      error_404
    end
  end
  
  private
    def render_custom_page_template
      if Rails.root.join('app', 'views', 'pages', "#{@page.slug.name}.html.erb").exist?
        render @page.slug.name + ".html.erb"
      end
    end

end
