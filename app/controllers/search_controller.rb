class SearchController < ApplicationController
   def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @method = params["search"]["method"]
    @records = search_for(@model,@content,@method)
    render "search/result"
  end

  private
    def search_for(model,content,method)
        if model == 'user'
          if method == 'parfect'
            User.where('name LIKE ?', content)
          elsif method == 'partial'
            User.where('name LIKE ?', '%'+content+'%')
          elsif method == 'front'
            User.where('name LIKE ?', content+'%')
          else method == 'back'
            User.where('name LIKE ?', '%'+content)
          end

        else
          if method == 'parfect'
            Book.where('title LIKE ?', content)
          elsif method == 'partial'
            Book.where('title LIKE ?', '%'+content+'%')
          elsif method == 'front'
            Book.where('title LIKE ?', content+'%')
          else method == 'back'
            Book.where('title LIKE ?', '%'+content)
          end
        end
    end
end