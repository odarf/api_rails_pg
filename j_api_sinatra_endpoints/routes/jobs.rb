namespace '/api/v1' do
  get '/jobs' do
    collection_to_api(DB[:jobs].all)
  end
  get '/jobs/:id' do
    collection_to_api(DB[:jobs].where({id: params[:id]}).all)
  end
  get '/jobs/:id/applies' do
    collection_to_api(DB[:applies].where({job_id: params[:id]}).all)
  end
  post '/jobs' do
    id = DB[:jobs].insert(name: params[:name], place: params[:place], company_id: params[:company_id])

    collection_to_api(DB[:jobs].where(:id => id).all)
  end
  post '/jobs/:id' do
    DB[:jobs].where(:id => params[:id]).update(name: params[:name], place: params[:place], company_id: params[:company_id])

    collection_to_api(DB[:jobs].where(:id => params[:id]).all)
  end
end

get '/jobs' do
  logger.info "Logger In get /gobs"
  jobs = Job.all
  [:place, :name].each do |filter|
    jobs = jobs.send(filter, params[filter]) if params[filter]
  end
  collection_to_api(jobs)
end
get '/jobs_company/:name' do
  company = Company.where(name: params[:name]).first
  halt(404, { message:'Company Document Not Found', status: 404, params_id: params[:id]}.to_json) unless company
  company_id = company.id
  puts "company id = #{company_id.inspect}"

  jobs = Job.where(company_id: company_id)
  halt(404, { message:'Documents Not Found', status: 404, params_id: params[:id]}.to_json) unless jobs
  # puts "job id = #{job.id.inspect} "
  # puts "job = #{job.values.inspect} "
  collection_to_api(jobs)
end
get '/job/:id' do
  job = Job.where(id: params[:id]).first
  halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) unless job
  puts "job id = #{job.id.inspect} "
  puts "job = #{job.values.inspect} "
  job.values.to_json    # serialization
end