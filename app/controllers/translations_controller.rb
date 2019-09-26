class TranslationsController < ApplicationController
  before_action :set_translation, only: [:show, :edit, :update, :destroy]

  # GET /translations
  # GET /translations.json
  def index
    @translations = Translation.all
  end

  # GET /translations/1
  # GET /translations/1.json
  def show
  end

  # GET /translations/new
  def new
    @translation = Translation.new
  end

  # GET /translations/1/edit
  def edit
  end

  # POST /translations
  # POST /translations.json
  def create
    if current_user
      @translation = Translation.new(translation_params)
      @translation.output = translate(@translation.input)
      
      respond_to do |format|
        if @translation.save
          format.html { redirect_to translations_path, notice: 'Translation was successfully created.' }
          format.json { render :show, status: :created, location: @translation }
        else
          format.html { render :new }
          format.json { render json: @translation.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to translations_path, notice: 'You are not logged in', status: 403}
        format.json { render json: {error: "Not logged in"}, status: 403}
      end
    end
  end

  # PATCH/PUT /translations/1
  # PATCH/PUT /translations/1.json
  def update
    @translation.output = translate(translation_params[:input])
    respond_to do |format|
      if @translation.update(translation_params)
        format.html { redirect_to translations_path, notice: 'Translation was successfully updated.' }
        format.json { render :show, status: :ok, location: @translation }
      else
        format.html { render :edit }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translations/1
  # DELETE /translations/1.json
  def destroy
    if current_user && current_user.role == "Admin"
      @translation.destroy
      respond_to do |format|
        format.html { redirect_to translations_url, notice: 'Translation was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def translate(input)
    output = input.gsub(/\w+/){|e|"#{e=~/^(qu|[^aeiou]+)/i?$'+$&:e}ay"}
    
    return output.downcase.titleize
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translation
      @translation = Translation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def translation_params
      params.require(:translation).permit(:input)
    end
end
