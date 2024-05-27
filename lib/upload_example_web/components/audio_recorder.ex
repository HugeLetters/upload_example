defmodule UploadExampleWeb.AudioRecorder do
  use UploadExampleWeb, :live_component

  @impl true
  def mount(socket) do
    {:ok,
     socket
     |> allow_upload(:audio, accept: ~w"audio/*", auto_upload: true)
     |> assign(recording?: false), layout: false}
  end

  @impl true
  def handle_event("recording", _params, socket) do
    {:noreply, socket |> assign(recording?: true)}
  end

  @impl true
  def handle_event("recorded", _params, socket) do
    IO.puts("recorded")
    {:noreply, socket}
  end

  def handle_event("save", _params, socket) do
    # It's aware of the new entry but it wasn't awaited even though it's a regular submit even
    socket.assigns.uploads.audio.entries |> IO.inspect()

    {:noreply, socket |> assign(recording?: false)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <form phx-submit="save" phx-target={@myself}>
      <button type="button" phx-hook="record-audio" id="audio-recorder">
        <%= if @recording? do %>
          recording
        <% else %>
          record
        <% end %>
      </button>
      <.live_file_input upload={@uploads.audio} phx-change="recorded" class="sr-only" />
    </form>
    """
  end
end
