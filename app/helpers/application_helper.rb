module ApplicationHelper
  def paginate_info(paginated)
    "显示 #{start = (paginated.current_page - 1) * paginated.limit_value + 1} - #{start + paginated.count - 1} 条，共 #{paginated.total_count} 条"
  end

  def is_current_nav?(key, options = {})
    @current_nav_keys ||= ::MenuNav.menus_nav[controller.controller_path].try('[]', action_name) || []
    is_current = @current_nav_keys.include?(key.to_s)
    if options[:if]
      is_current = is_current && options[:if].call
    end
    is_current
  end

  # 是否当前路径
  def current_nav_class(key, options = {})
    options.reverse_merge!(:current => 'active', :not_current => '')
    is_current_nav?(key, options) ? options[:current] : options[:not_current]
  end

  def wangedit attribute=nil, from=nil, label=nil, value=nil, width: 835, height: 500
    html = %{
      <div class="layui-form-item">
        <label class="layui-form-label">#{label}</label>
        <div class="layui-input-block">
          <textarea id="wangEditor-one" style="height: #{height}px;" name="#{from}[#{attribute}]">#{value}</textarea>
        </div>
      </div>
      <script>
        $(function(){
          editorWang();
        })
      </script>
    }
    html.html_safe
  end

  # pc上传组件
  def webuploader_tag(name, label: '上传', type: 'image', id: 'webuploader', klass: 'webuploader', asset: nil)
    html = %{
      <div id="#{id}" class="upload-wrap #{klass}" data-name="#{name}" data-url="#{uploads_path}" data-type="#{type}">
        <div class="upload-body">
          <ul class="upload-list">
          }
    [asset].flatten.compact.select {|a| !a.new_record?}.each do |a|
      html << %{
                <li id="#{a.id}" class="file-item thumbnail">
                  #{link_to 'x', upload_path(a, file_id: a.id, protect_token: a.protect_token), method: :delete, remote: true, class: 'delete'}
      #{hidden_field_tag name, a.id}
      #{image_tag a.file.url}
                </li>
              }
    end
    html << %{
            <li class="upload-pick">
              <span><i class="iconfont icon-plus2"></i></span>
              <strong>#{label}</strong>
            </li>
          </ul>
        </div>
      </div>
    }
    html.html_safe
  end
end
