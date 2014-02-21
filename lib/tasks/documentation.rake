Rake::Task["doc:app"].clear
Rake::Task["doc/app"].clear
Rake::Task["doc/app/index.html"].clear

namespace :doc do
    Rake::RDocTask.new('app') do |rdoc|
        rdoc.rdoc_dir = '../app_documents/blueprint'
        rdoc.title    = 'app.blueprint.com Technical Reference Manual'
        rdoc.main     = '/doc/README_FOR_APP' # define README_FOR_APP as index

        rdoc.options << '--charset' << 'utf-8'

        rdoc.rdoc_files.include('app/**/*.rb')
        rdoc.rdoc_files.include('lib/**/*.rb')
        rdoc.rdoc_files.include('doc/README_FOR_APP')

    end
end