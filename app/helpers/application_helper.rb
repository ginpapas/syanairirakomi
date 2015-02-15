module ApplicationHelper
  def hosi num

    return '★' if num == 1
    return '★★' if  num == 2
    return '★★★' if  num == 3
    return '★★★★' if  num == 4
    return '★★★★★' if  num == 5
  
  end
end
