module Web::ScaffoldHelper

  def admin_index_scaffold(collection, fields, actions)
    render 'web/admin/common/index', locals: { collection: collection, fields: fields, actions: actions }
  end

end
