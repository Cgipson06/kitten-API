class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
  end
    def create 
    @kitten = Kitten.new(kitty_params)
     if @kitten.save
      flash[:success] = "Kitten Created!"
      redirect_to @kitten
    else
      flash.now[:notice] = "Kittens cry everytime you mess up a form :( "
      render 'new'
    end
  end

  
  def edit
    @kitten = Kitten.find(params[:id])
  end
  
  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitty_params)
      flash[:success] = "Kitten Updated!"
      redirect_to root_path
    else
      flash.now[:notice] = "You like to make kittens sad with your poor form skills"
      render 'edit'
    end
  end
  
    def index
    @kitten = Kitten.all
  end
  
  def show
    @kitten = Kitten.find(params[:id])
  end
  
  
  

  
  def destroy
   @kitten = Kitten.find(params[:id])
   if @kitten.delete
   flash[:success] = "Kitty go bye-bye"
   redirect_to root_path
   end
  end
  
    private
    
    
    
  def kitty_params
    params.require(:kitten).permit(:name, :cuteness, :softness, :age, :id )
  end

end
