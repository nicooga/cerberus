class Cerberus::Railtie < Rails::Railtie
  rake_tasks do
    Dir.glob(File.join(Cerberus.root, 'lib/tasks/*.rake')).each { |f| load f }
  end
end
