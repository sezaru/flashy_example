defmodule FlashyExampleWeb.Live.MainPage do
  @moduledoc false

  alias FlashyExampleWeb.Live.MainPage.CustomComponent

  alias FlashyExampleWeb.Components.Notifications

  use FlashyExampleWeb, :live_view

  import PetalComponents.Button

  def handle_event("info", _, socket) do
    message = "Blibs <i>blobs</i>"

    notification = Notifications.Normal.new(:info, message)

    socket = socket |> put_notification(notification)

    {:noreply, socket}
  end

  def handle_event("success", _, socket) do
    message = "Blibs <i>blobs</i>"

    notification = Notifications.Normal.new(:success, message)

    socket = socket |> put_notification(notification)

    {:noreply, socket}
  end

  def handle_event("warning", _, socket) do
    message = "Blibs <i>blobs</i>"

    notification = Notifications.Normal.new(:warning, message)

    socket = socket |> put_notification(notification)

    {:noreply, socket}
  end

  def handle_event("danger", _, socket) do
    message = "Blibs <i>blobs</i>"

    notification = Notifications.Normal.new(:danger, message)

    socket = socket |> put_notification(notification)

    {:noreply, socket}
  end

  def handle_event("info_no_close", _, socket) do
    options = Flashy.Normal.Options.new(closable?: false)
    message = "Blibs <i>blobs</i>"

    notification = Notifications.Normal.new(:info, message, options)

    socket = socket |> put_notification(notification)

    {:noreply, socket}
  end

  def handle_event("success_no_close", _, socket) do
    options = Flashy.Normal.Options.new(closable?: false)
    message = "Blibs <i>blobs</i>"

    notification = Notifications.Normal.new(:success, message, options)

    socket = socket |> put_notification(notification)

    {:noreply, socket}
  end

  def handle_event("warning_no_close", _, socket) do
    options = Flashy.Normal.Options.new(closable?: false)
    message = "Blibs <i>blobs</i>"

    notification = Notifications.Normal.new(:warning, message, options)

    socket = socket |> put_notification(notification)

    {:noreply, socket}
  end

  def handle_event("danger_no_close", _, socket) do
    options = Flashy.Normal.Options.new(closable?: false)
    message = "Blibs <i>blobs</i>"

    notification = Notifications.Normal.new(:danger, message, options)

    socket = socket |> put_notification(notification)

    {:noreply, socket}
  end

  def handle_event("info_no_dismiss", _, socket) do
    options = Flashy.Normal.Options.new(dismissible?: false)
    message = "Blibs <i>blobs</i>"

    notification = Notifications.Normal.new(:info, message, options)

    socket = socket |> put_notification(notification)

    {:noreply, socket}
  end

  def handle_event("success_no_dismiss", _, socket) do
    options = Flashy.Normal.Options.new(dismissible?: false)
    message = "Blibs <i>blobs</i>"

    notification = Notifications.Normal.new(:success, message, options)

    socket = socket |> put_notification(notification)

    {:noreply, socket}
  end

  def handle_event("warning_no_dismiss", _, socket) do
    options = Flashy.Normal.Options.new(dismissible?: false)
    message = "Blibs <i>blobs</i>"

    notification = Notifications.Normal.new(:warning, message, options)

    socket = socket |> put_notification(notification)

    {:noreply, socket}
  end

  def handle_event("danger_no_dismiss", _, socket) do
    options = Flashy.Normal.Options.new(dismissible?: false)
    message = "Blibs <i>blobs</i>"

    notification = Notifications.Normal.new(:danger, message, options)

    socket = socket |> put_notification(notification)

    {:noreply, socket}
  end

  def handle_event("info_timeout", _, socket) do
    options = Flashy.Normal.Options.new(dismiss_time: :timer.seconds(2))
    message = "Blibs <i>blobs</i>"

    notification = Notifications.Normal.new(:info, message, options)

    socket = socket |> put_notification(notification)

    {:noreply, socket}
  end

  def handle_event("redirect", _, socket) do
    message = "Redirected to other page"

    notification = Notifications.Normal.new(:info, message)

    socket = socket |> put_notification(notification) |> push_navigate(to: ~p"/")

    {:noreply, socket}
  end

  def handle_event("replace_1", _, socket) do
    message = "Replace 1"

    notification = Notifications.Normal.new(:info, message)

    socket = socket |> put_notification(notification, key: "replace_key")

    {:noreply, socket}
  end

  def handle_event("replace_2", _, socket) do
    message = "Replace 2"

    notification = Notifications.Normal.new(:info, message)

    socket = socket |> put_notification(notification, key: "replace_key")

    {:noreply, socket}
  end

  def handle_info({:notification, notification}, socket) do
    {:noreply, put_notification(socket, notification)}
  end
end
