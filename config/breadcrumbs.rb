crumb :root do
  link "入(い)り口(ぐち)", root_path
end

crumb :kind_japanese do
  link "5つのわかりません", kind_japanese_index_path
  parent :root
end

crumb :topiced do |topic|
  link "文章(ぶんしょう)を探(さが)します", search_topics_path
  parent :root
end

crumb :topic do |topic|
  link "文章(ぶんしょう)を説明(せつめい)します、話(はな)します", topic_path(topic.id)
  parent :root
end

crumb :edit_topic do |topic|
  link "書(か)き直(なお)します", edit_topic_path
  parent :topic ,topic
end

crumb :topics do
  link "文章(ぶんしょう)を送(おく)ります", new_topic_path
  parent :root
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