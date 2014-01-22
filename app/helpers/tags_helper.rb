module TagsHelper

  def tag_element(tag, need_link = true)
    "<span class='tag' style='background-color: ##{tag.color_string}'>
      #{need_link ? link_to(tag.name, people_by_tag_path(tag.name)) : tag.name}
    </span>".html_safe
  end

end
