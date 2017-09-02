class CompilationsController < ApplicationController

  before_filter :authorize, except: [:index, :show]

  before_filter :set_compilation, except: [:index, :new, :create]
  before_filter :can_modify_compilation?, except: [:index, :new, :create]

  def index
    @compilations = Compliations.all
  end

  def new
  end

  def create
  end

  def show;end

  def edit;end

  def update
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

end