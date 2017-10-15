class CompilationsController < ApplicationController

  before_filter :authorize, except: [:index, :show, :favourite_data]

  before_filter :set_compilation, except: [:index, :new, :create]
  before_filter :can_modify_compilation?, except: [:index, :new, :create, :show, :favourite, :favourite_data]

  def index
    @compilations = Compilation.all
    if params[:sort] == "new"
      @compilations = @compilations.order('id DESC')
    else
      @compilations = @compilations.order('fave_count DESC')
    end
  end

  def new
    @compilation = Compilation.new
    @compilation.tweets.build
  end

  def create
    @compilation = current_user.compilations.new(compilation_params)
    if @compilation.save
      redirect_to(@compilation, :notice => 'Successfully created.')
    else
      render :action => "new"
    end
  end

  def show;end

  def edit;end

  def update
    if @compilation.update(compilation_params)
      redirect_to(@compilation, :notice => 'Successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @compilation.destroy
    redirect_to root_url
  end

  def favourite
    if params[:type] == "fave"
      current_user.favourites << @compilation
    else
      current_user.favourites.delete @compilation
    end
    render json: {count: @compilation.fave_count}
  end

  def favourite_data
    count = @compilation.fave_count
    fave = current_user ? current_user.favourites.find_by(id: @compilation.id).present? : false
    render json: {count: count, fave_status: fave}
  end

  private

  def set_compilation
    @compilation = Compilation.find params[:id]
  end

  def can_modify_compilation?
    unless current_user.id == @compilation.user.id
      redirect_to(@compilation, :error => 'Permission Denied.')
    end
  end

  def compilation_params
    params.require(:compilation).permit(:title, :description, tweets_attributes: [:id, :link, :title, :_destroy])
  end

end