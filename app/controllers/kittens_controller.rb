class KittensController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.json { render json: @kittens }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)

    respond_to do |format|
      if @kitten.save
        format.html { redirect_to @kitten, notice: "Kitten was successfully registered." }
        format.json { render :show, status: :created, location: @kitten }
      else
        format.html do
          flash.now[:alert] = mocking_message(@kitten)
          render :new, status: :unprocessable_entity
        end

        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @kitten.update(kitten_params)
        format.html { redirect_to @kitten, notice: "Details about the kitten has been updated successfully." }
        format.json { render :show, status: :ok, location: @kitten }
      else
        format.html do
          flash.now[:alert] = mocking_message(@kitten)
          render :edit, status: :unprocessable_entity
        end

        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @kitten.destroy!

    respond_to do |format|
      format.html { redirect_to kittens_path, notice: "Kitten data was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.expect(kitten: [ :name, :age, :cuteness, :softness ])
  end

  def mocking_message(kitten)
    problems = kitten.errors.full_messages.to_sentence
    "You have problems in your form and you have failed the easy task of filling it... The problem: #{ problems}."
  end
end
