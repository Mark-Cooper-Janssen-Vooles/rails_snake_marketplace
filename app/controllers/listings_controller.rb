class ListingsController < ApplicationController
  before_action :authenticate_user!
  ##
  before_action :set_listing, only: [:show ]
  ##
  before_action :set_user_listing, only: [ :edit, :update, :destroy]

  def index
      @listings = Listing.all.sort
      #displays only current user listings
      # @listings = current_user.listings
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    # @listing = Listing.create(listing_params)
    
    # @listing = Listing.new(listing_params)
    @listing = current_user.listings.new(listing_params)

    if @listing.save
      #all good
      redirect_to @listing
    else
      flash[:errors] = @listing.errors.full_messages
      render new_listing_path
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing
    else
      render :edit
    end
  end

  def destroy
    @listing.destroy
      #finish logic for deleting the record
      redirect_to listings_path
  end

  private
  def set_listing
    id = params[:id]
    @listing = Listing.find(id)
  end

  ###
  def set_user_listing
    id = params[:id]
    @listing = current_user.listings.find_by_id(id)

    if @listing == nil 
      redirect_to listings_path
    end 
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :price, :deposit, :city, :state, :date_of_birth, :sex, :diet, :breed_id, :picture )
  end
end