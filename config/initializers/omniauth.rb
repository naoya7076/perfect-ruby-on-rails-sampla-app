Rails.application.config.middleware.use Omniauth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider: github, "113e886227d307cc295f", "46445ba3e922b37520f452f728bb7405fb569cb7"
  else
    provider :github,
      Rails.application.credentials.github[:client_id],
      Rails.application.credentials.github[:client_secret]
  end
end