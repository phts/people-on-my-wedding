class TagsController < ApplicationController
  before_action :all_people, only: [:new, :create, :edit, :update]
  before_action :set_tag, only: [:show, :edit, :update, :destroy, :people]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all.order('name ASC')
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)
    assign_people

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tag }
      else
        format.html { render action: 'new' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    assign_people

    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url }
      format.json { head :no_content }
    end
  end

  def people
    @people = @tag.people.order('name ASC')
  end

  private

  def all_people
    @people = Person.all.order('name ASC')
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit(:name, :change_color)
  end

  def assign_people
    return unless params[:person] && params[:person].is_a?(Hash)

    selected_people = params[:person].keys.map do |id|
      begin
        Person.find(id)
      rescue
        nil
      end
    end
    selected_people.compact!
    @tag.people = selected_people
  end

end
