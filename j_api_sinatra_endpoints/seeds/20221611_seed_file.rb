Sequel.seed(:development, :test) do # Applies only to "development" and "test" environments
  def run
    puts 'Start truncate for all models'
    DB[:applies].truncate(cascade: true, restart: true)
    DB[:geeks].truncate(cascade: true, restart: true)
    DB[:jobs].truncate(cascade: true, restart: true)
    DB[:companies].truncate(cascade: true, restart: true)
    puts 'Models truncated'
    puts 'Start to write models'
    DB[:companies].insert(name: "Gazprom", location: "Saint-Petersburg")
    DB[:companies].insert(name: "Sberbank", location: "Moscow")
    DB[:companies].insert(name: "VTB", location: "Samara")

    DB[:jobs].insert(name: "Full-stack developer", place: "Moscow", company_id: 1)
    DB[:jobs].insert(name: "DevOps Engineer", place: "Samara", company_id: 2)
    DB[:jobs].insert(name: "QA Engineer", place: "Saint-Petersburg", company_id: 3)
    DB[:jobs].insert(name: "System architect", place: "Moscow", company_id: 1)

    DB[:geeks].insert(name: "Andrey", stack: "some_stack_1", resume: "cv_1")
    DB[:geeks].insert(name: "Ivan", stack: "some_stack_2", resume: "cv_2")
    DB[:geeks].insert(name: "Alexander", stack: "some_stack_3", resume: "cv_3")

    DB[:applies].insert(job_id: 1, geek_id: 1)
    DB[:applies].insert(job_id: 1, geek_id: 2)
    DB[:applies].insert(job_id: 2, geek_id: 2)

    puts 'Models seeded'
  end
end