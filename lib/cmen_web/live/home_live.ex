defmodule CmenWeb.HomeLive do
  use CmenWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       active_menopause_section: "perimenopauza",
       mobile_menu_open: false,
       form_data: %{}
     )}
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

  @impl true
  def handle_event("send_contact_email", params, socket) do
    case Cmen.Email.contact_form_email(params) |> Cmen.Mailer.deliver() do
      {:ok, _} ->
        socket =
          socket
          |> put_flash(
            :info,
            gettext("Mesajul dvs. a fost trimis cu succes! Vă vom contacta în curând.")
          )
          |> assign(form_data: %{})
          |> push_event("reset-form", %{})

        {:noreply, socket}

      {:error, _reason} ->
        socket =
          socket
          |> put_flash(
            :error,
            gettext("A apărut o eroare la trimiterea mesajului. Vă rugăm să încercați din nou.")
          )
          |> assign(form_data: params)

        {:noreply, socket}
    end
  end
end
