module Web::LocalizationHelper
  
  def l_layout_title(title)
    "#{title} #{ I18n.t 'web.base_title' }"
  end
  
  def l_route_key 
    "#{ params[:controller].gsub('/', '.') }.#{ params[:action].gsub('create', 'new') }"
  end
  
  def l_title
    "#{ l_route_key }.title"
  end
  
  def l_sub_title
    "#{ l_route_key }.sub_title"
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
  
  def t_new_member_field(name)
    I18n.t "activerecord.attributes.member.#{name}"
  end
  
  def t_new_member_picture_field(name)
    I18n.t "activerecord.attributes.member_picture.#{name}"
  end
end
