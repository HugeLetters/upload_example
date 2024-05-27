defmodule UploadExample.Repo do
  use Ecto.Repo,
    otp_app: :upload_example,
    adapter: Ecto.Adapters.Postgres
end
