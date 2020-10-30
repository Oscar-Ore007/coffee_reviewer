module ReviewsHelper
def display_header(review)
    if params[:coffee_id]
        content_tag(:h1, "Add a Review for #{review.coffee.flavor} -  #{review.coffee.brand.name}")
    else
      content_tag(:h1, "Create a review")
    end
  end
end
