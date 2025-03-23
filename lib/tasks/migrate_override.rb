Rake::Task["db:migrate"].enhance do
  Rake::Task["db:migrate:with_data"].invoke
end
