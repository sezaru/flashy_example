defmodule FlashyExampleWeb.Live.MainPage.CustomComponent do
  @moduledoc false

  alias FlashyExampleWeb.Components.Notifications

  use FlashyExampleWeb, :live_component

  import PetalComponents.Button

  attr :id, :string, required: true

  def live_render(assigns), do: ~H"<.live_component module={__MODULE__} {assigns} />"

  def update(%{answer: answer}, socket),
    do: {:ok, assign(socket, answer: answer)}

  def update(assigns, socket) do
    assigns = Map.put(assigns, :answer, nil)

    {:ok, assign(socket, assigns)}
  end

  def handle_event("custom", _, socket) do
    %{id: id} = socket.assigns

    notification = Notifications.Custom.new("How are you today?", __MODULE__, id)

    send(self(), {:notification, notification})

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div id={@id}>
      <.button phx-click="custom" phx-target={@myself}>Show question notification</.button>

      <div :if={@answer}>
        Got answer: <%= @answer %>
      </div>
    </div>
    """
  end
end
