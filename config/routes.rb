Rails.application.routes.draw do
  get 'video/index'
  get 'video/watch'
  get 'video/host'
  get 'video/new'
  get 'navigator/show'

  post 'video/hoster'
  post 'video/add'
  post 'navigator/navigate'
end
