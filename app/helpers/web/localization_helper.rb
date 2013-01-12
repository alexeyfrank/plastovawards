module Web::LocalizationHelper
  
  def l_route_key 
    "#{ params[:controller].gsub('/', '.') }.#{ params[:action] }"
  end
  
  def l_title
    "#{ l_route_key }.title"
  end
  
  def l_field_name(name)
    "#{ l_route_key }.model.#{name}"
  end
  
  def l_action_btn(action)
    "#{ l_route_key }.actions.#{action}"
  end
  
  def l_confirm_destroy_msg
    "#{ l_route_key }.confirm_destroy_msg"
  end
end
