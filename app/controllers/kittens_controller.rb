class KittensController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @kittens = Kitten.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_post
    @kitten = Kitten.find(params[:id])
  end
end
