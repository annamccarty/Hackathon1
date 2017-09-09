class BiosController < ApplicationController
  before_action :set_user
  before_action :set_bio, only: [:edit, :update, :show, :destroy]

  def show
  end

  def create
    @bio = @user.build_bio(bio_params)

    if @bio.save
      redirect_to [@user, @bio]
    else
      render :new
    end
  end

  def new
    @bio = Bio.new
    render partial: 'form'
  end

  def edit
    render partial: 'form'
  end

  def update
    if @bio.update(bio_params)
      redirect_to [@user, @bio]
    else
      render :edit
    end
  end

  def destroy
    @bio.destroy
    redirect_to user_path(@user)
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_bio
      @bio = Bio.find(params[:id])
    end

    def bio_params
      params.require(:bio).permit(:profile_image, :description)
    end
end
