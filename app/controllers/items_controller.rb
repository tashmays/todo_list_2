class ItemsController < ApplicationController
  def index
  	# index is a GET route
  	# shows all the items 
  	@items = Item.all #grabs all items out of the database
  end

  def show
  	# show is a GET route
  	# responsible for showing a single item or shows more information
  	@item = Item.find(params[:id])
  end

  def new
  	# new is a GET route
  	# responsible for rendering the form to create a new item
  	@item = Item.new #creates a new instance of this item
  end

  def create
  	# create is a POST route
	  # this was later added on because we didn't need to render a view for 'create'
	  # responsible for creating the item and redirecting the user
	  @item = Item.new(item_params)
	   if @item.save
	  	# redirect back to the index page
	  	redirect_to items_path
	  else
	  	# render the new form again and show users errors
	  	render :new
	  end
  end

  def edit
  	# edit is a GET route
  	# responsible for rendering the form so we can edit a single item
  	@item = Item.find(params[:id])
  end

  def update
  	# update is a PUT route
  	# responsible for updating the item and redirecting the user
  	@item = Item.find(params[:id])
  	if @item.update(item_params)
  		# redirect to the show page
  		redirect_to items_path(@items)
  	else
  		# TODO: show errors to user
  		render :edit 
    end
  end

	def destroy
		# destroy is a DELETE route
	  # responsible for finding the item, and removing it from our database
	  item = Item.find(params[:id])
	  if item.destroy
	  	# TODO: put a flash message for better user experience
	  	redirect_to items_path
	  	# redirect back to the index page
	  else
	  	# show an error message
	  	redirect_to items_path(item)
	  	# redirect back to show page 
	  end
	end  

	private 
		def item_params
			params.require(:item).permit(:name, :description, :completed, :priority)
			# require gets the values of the item key and permit certain attributes
		end
	end

