crumb :root do
  link "Home", root_path
end

crumb :registrations_new do
  link "ユーザー登録", new_user_registration_path
  parent :root
end

crumb :sessions_new do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :items_edit do
  link "商品情報の編集", edit_item_path
  parent :items_show
end

crumb :items_new do
  link "新規出品", new_item_path
  parent :root
end


  crumb :items_show do
    link "商品詳細", item_path(current_user.id)
    parent :root
  end




crumb :purchases_index do
  link "商品の購入", item_purchases_path
  parent :items_show
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).