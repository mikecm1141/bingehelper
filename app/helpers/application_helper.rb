module ApplicationHelper
  def confirm_destroy(name)
    { confirm: "Delete #{name}?" }
  end
end
