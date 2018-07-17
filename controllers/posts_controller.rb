class PostsController < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  $phones = [{
    	 id: 0,
    	 title: "iPhone",
    	 body: "This is the iPhone"
    },
    {
        id: 1,
        title: "Samsung",
        body: "This is the Samsung"
    },
    {
        id: 2,
        title: "HuaWei",
        body: "This is the HuaWei"
    }];

  # INDEX
  get "/" do
    @title = "Blog Posts"
    @phone = $phones
    erb :"posts/index"
  end

  # NEW
  get "/new" do
    "This is the new route!"
  end

  # SHOW
  get "/:id" do
    id = params[:id].to_i
    @phone = $phones[id]

    erb :"posts/show"
  end

  # CREATE
  post "/" do
    "This is the create route!"
  end

  # EDIT
  get "/:id/edit" do
    id = params[:id].to_i
    erb :"posts/edit"
  end

  # UPDATE
  put "/:id" do
    id = params[:id]
    "This is the update route for #{id}"
  end

  # DESTROY
  delete "/:id" do
    id = params[:id]
    "This is the delete route for #{id}"
  end

end
