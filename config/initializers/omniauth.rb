Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['790888107675322'], ENV['3d3337ce29a2372ee99485d2e58dcceb']
    :scope => 'email', :display => 'popup'
end