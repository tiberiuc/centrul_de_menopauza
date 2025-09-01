defmodule CmenWeb.HomeLive do
  use CmenWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, active_menopause_section: "perimenopauza", mobile_menu_open: false)}
  end

  @impl true
  def handle_event("scroll_to_section", %{"section" => section}, socket) do
    socket = assign(socket, mobile_menu_open: false)
    {:noreply, push_event(socket, "scroll-to", %{id: section})}
  end

  @impl true
  def handle_event("change_menopause_section", %{"section" => section}, socket) do
    {:noreply, assign(socket, active_menopause_section: section)}
  end

  @impl true
  def handle_event("toggle_mobile_menu", _params, socket) do
    {:noreply, assign(socket, mobile_menu_open: !socket.assigns.mobile_menu_open)}
  end

  @impl true
  def handle_event("close_mobile_menu", _params, socket) do
    {:noreply, assign(socket, mobile_menu_open: false)}
  end
end
