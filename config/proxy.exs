use Mix.Config

default_endpoint = [
  %{
    phoenix_endpoint: Public.Endpoint,
  }
]
prod_endpoint = [
  %{
    host: ~r/^public.com/,
    phoenix_endpoint: Public.Endpoint,
  }
]
dev_endpoint =
  if Mix.env() in [:dev, :test] do
    [
      %{
        host: ~r/^public.*/,
        phoenix_endpoint: SiteGow.Endpoint
      }
    ]
  else
    [ ]
  end



# Configure master_proxy
config :master_proxy,
  url: [host: "localhost"],
  http: [port: System.get_env("PORT") || 8080],
  backends: prod_endpoint ++ dev_endpoint ++ default_endpoint
