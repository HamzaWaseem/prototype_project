SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'nav side-menu'
    primary.selected_class = 'active'
    if @current_user_role == AppConstants::ADMIN
      primary.item :users, content_tag(:i, "", :class => "fa fa-users") + "Users", users_path, :highlights_on => /\/users/
      primary.item :forms, content_tag(:i, "", :class => "fa fa-wpforms") + "Forms", forms_path, :highlights_on => /\/forms/

    elsif @current_user_role == AppConstants::CUSTOMER
      primary.item :forms, content_tag(:i, "", :class => "fa fa-wpforms") + "Forms", forms_path, :highlights_on => /\/forms/
    end

  end
end

#primary.item :secondary, content_tag(:span, "Help", :class => "top_menu_bg"), quick_helps_url(:role_key => "Manager"), :highlights_on => /\/quick_helps|\/quick_help_questions/ do |secondary|
#  secondary.item :help_managers, content_tag(:span, 'Manager', :class => "top_menu_bg"), quick_helps_url(:role_key => "Manager"), :highlights_on => Proc.new { (params[:role_key] == "Manager" && on_controller?("quick_helps")) }
#  secondary.item :help_contractors, content_tag(:span, 'Service Provider', :class => "top_menu_bg"), quick_helps_url(:role_key => "Service Provider"), :highlights_on => Proc.new { (params[:role_key] == "Service Provider" && on_controller?("quick_helps")) }
#end

#primary.item :mail_boxes, content_tag(:span, 'Mail Box', :class => "top_menu_bg"), mail_boxes_url(), :highlights_on => /\/mail_boxes/
#primary.item :admin_profiles, content_tag(:span, 'My Profile', :class => "top_menu_bg"), edit_admin_profile_url(current_user.profile), :highlights_on => lambda { @admin_profile.present? }
