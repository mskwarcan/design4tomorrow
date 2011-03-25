User.find(:all).each do |user|
  if user.plugins.find_by_name('sign_ups').nil?
    user.plugins.create(:name => 'sign_ups',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

page = Page.create(
  :title => 'Sign Ups',
  :link_url => '/sign_ups',
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/sign_ups(\/|\/.+?|)$'
)
Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
