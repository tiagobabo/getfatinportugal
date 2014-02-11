class Admin::NewsController < Admin::AdminController
  layout 'admin'
  def index
    @news = New.active.all
  end

  def show
  end

  def new
    @new = New.new
     @action_to='create'
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @new }
    end
  end

  def create
    @new = New.new(params[:new])

    respond_to do |format|
      if @new.save
        format.html { redirect_to :action=>'index' }
        format.json { render json: @new, status: :created, location: @new }
      else
        format.html { render action: "new" }
        format.json { render json: @new.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @new = New.find(params[:id])
    @action_to='update'
  end 

  def update  
    @new = New.find(params[:id])
    respond_to do |format|
      if @new.update_attributes(params[:new])
        format.html { redirect_to :action=>'index' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @new.errors, status: :unprocessable_entity }
      end
    end      
  end

  def destroy
    @new = New.find(params[:id])
    @new.destroy

    respond_to do |format|
      format.html {redirect_to  :action => "show" }
      format.js   { render :nothing => true }
    end

  end

end
