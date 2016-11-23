module ApplicationHelper
 
#Returns the full title on a per-page basis.
  def full_title(page_title='')
    base_title="Parsley - new way to buy"
    if page_title.empty?
      base_title
    else 
      page_title + " | " + base_title
    end
   end
end

