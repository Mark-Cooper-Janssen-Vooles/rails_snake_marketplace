class BreedsController < ApplicationController

  def index
    #working
    @breeds = Breed.all
  end

  def new 
    #working
    @breed = Breed.new
  end

  def show
    @breed = Breed.find(params[:id])

  end

  def create
    #working
    Breed.create(breed_params)
    redirect_to breeds_path
  end

  def edit
    @breed = Breed.find(params[:id])
    # @breed = Breed.update(breed_params)
    # @breed.save
  end

  def update
    @breed = Breed.find(params[:id])

    @breed.update(breed_params)
    redirect_to @breed
  end

  def destroy
    #working
    @breed = Breed.find(params[:id])

    if @breed.destroy
      redirect_to breeds_path
    else
      render :destroy
    end
  end

  private
  def breed_params
    params.require(:breed).permit(:name)
  end

end
