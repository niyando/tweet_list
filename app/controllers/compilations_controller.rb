class CompilationsController < ApplicationController

  before_filter :authorize, except: [:index, :show]

  before_filter :set_compilation, except: [:index, :new, :create]
  before_filter :can_modify_compilation?, except: [:index, :new, :create]

  def index
    @compilations = Compilation.all
  end

  def new
    @compilation = Compilation.new
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
    if @compilation.update_attributes(compilation_params)
      redirect_to(@compilation, :notice => 'Successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
  end

  private

  def set_compilation
    @compilation = Compilation.find params[:id]
  end

  def can_modify_compilation?
    unless current_user.id == @compilation.user.id
      # redirect and show error
    end
  end

  def compilation_params
    params.require(:compilation).permit(:title, :description)
  end

end