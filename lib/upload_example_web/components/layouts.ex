defmodule UploadExampleWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use UploadExampleWeb, :controller` and
  `use UploadExampleWeb, :live_view`.
  """
  use UploadExampleWeb, :html

  def root(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en" class="[scrollbar-gutter:stable]">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="csrf-token" content={get_csrf_token()} />
        <.live_title suffix=" · Phoenix Framework">
          <%= assigns[:page_title] || "UploadExample" %>
        </.live_title>
        <link phx-track-static rel="stylesheet" href={~p"/assets/app.css"} />
        <script defer phx-track-static type="text/javascript" src={~p"/assets/app.js"}>
        </script>
      </head>
      <body class="bg-white antialiased">
        <%= @inner_content %>
      </body>
    </html>
    """
  end
end
