class RsvpsController < ApplicationController
  def index
      redirect_to new_rsvp_path
  end

  def new
    @rsvp = Rsvp.new
  end

  def create
    @rsvp = Rsvp.new(params[:rsvp])

    if @rsvp.save
      flash[:notice] = "If you need to come back to edit your RSVP, remember you used #{@rsvp.email}"
      redirect_to thanks_url
    else
      flash[:error] = "Sorry, something went wrong..."
      render :action => 'new'
    end
  end

  def edit
    email = params[:email]

    if email
      @rsvp = Rsvp.find_by_email(email)
      unless @rsvp
        flash[:error] = "Sorry, could not find this email address"
        redirect_to :login
      end

      flash[:notice] = "You are editing your RSVP"
    else
      # send back to email entry
      redirect_to :login
    end
  end

  def update
    @rsvp = Rsvp.find(params[:id])
    if @rsvp.update_attributes(params[:rsvp])
      flash[:notice] = "YOUR RSVP HAS BEEN UPDATED"
    else
      flash[:notice] = "You are editing your RSVP"
      flash[:error] = "Sorry, something went wrong..."
    end

    render :action => 'edit'

  end

  def all
   if params[:password] == "ss2011"
      @rsvps = Rsvp.all
      render :index
    else
      #do nothing
   end
  end

  def login

  end

  def thanks

  end

end

