class HomeController < ApplicationController
  def index
    # Redirect logged in users to their feed
    if user_signed_in?
      redirect_to posts_url
    end
  end
end
