# responsible for glyphicons sync
module ViewHelper
  def icon(type, style = nil)
    raw "<span class=\"glyphicon glyphicon-#{type}\" #{ style ? 'style="' + style + '"' : ''}></span>"
  end
end
