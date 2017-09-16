class Embed::CompilationsController < ActionController::Base
  layout false
  before_filter :set_compilation

  def show;end

  private

  def set_compilation
    @compilation = Compilation.find params[:id]
    response.headers.delete "X-Frame-Options"
  end

end