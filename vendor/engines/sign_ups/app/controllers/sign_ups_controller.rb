class SignUpsController < ApplicationController

  before_filter :find_all_sign_ups
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @sign_up in the line below:
    present(@page)
    @sign_up = SignUp.new
  end

  def show
    @sign_up = SignUp.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @sign_up in the line below:
    present(@page)
  end
  
  def create

    @sign_up = SignUp.new(params[:sign_up])

    respond_to do |format|
         if @sign_up.save
           SignUpMailer.signup_mail(@sign_up).deliver unless refinery_user?
           format.html { render :action => "index"}
           format.xml  { render :xml => @sign_up, :status => :created, :location => @sign_up }
         else
           format.html { render :action => "index" }
           format.xml  { render :xml => @sign_up.errors, :status => :unprocessable_entity }
         end
       end
  end

protected

  def find_all_sign_ups
    @sign_ups = SignUp.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/sign_ups")
  end

end
