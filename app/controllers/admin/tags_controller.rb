class Admin::TagsController < Admin::BaseController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag successfully created"
      redirect_to admin_tags_path
    else
      flash[:errors] = @tag.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = "Successfully updated tag"
      redirect_to admin_tags_path
    else
      render :edit
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:label)
  end

end
