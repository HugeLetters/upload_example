defmodule UploadExampleWeb.IndexLive do
  use UploadExampleWeb, :live_view

  def render(assigns) do
    ~H"""
    <.live_component module={UploadExampleWeb.AudioRecorder} id="audio-recorder" />
    """
  end
end
