defmodule CmenWeb.NavigationComponent do
  use CmenWeb, :html

  attr :mobile_menu_open, :boolean, default: false
  attr :class, :string, default: nil

  def navigation_menu(assigns) do
    ~H"""
    <nav class={[
      "fixed top-0 w-full bg-white/95 backdrop-blur-sm border-b border-gray-100 z-50",
      @class
    ]}>
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
          <div class="flex items-center space-x-3">
            <h1 class="text-xl font-bold text-pink-600">
              {gettext("Centrul de Menopauză")}
            </h1>
            <div>
              <span class="text-base font-semibold text-black" style="font-family: 'Cormorant Garamond', serif;">
                AESTHETIC LAB
              </span>
            </div>
          </div>
          <div class="hidden md:block">
            <div class="ml-10 flex items-baseline space-x-8">
              <.nav_button section="home">
                {gettext("Home")}
              </.nav_button>
              <.nav_button section="about">
                {gettext("About")}
              </.nav_button>
              <.nav_button section="services">
                {gettext("Services")}
              </.nav_button>
              <.nav_button section="understanding">
                {gettext("Ghid Menopauză")}
              </.nav_button>
              <.nav_button section="bhrt">
                {gettext("Terapie BHRT")}
              </.nav_button>
              <.nav_button section="contact">
                {gettext("Contact")}
              </.nav_button>
            </div>
          </div>
          <div class="md:hidden">
            <button
              phx-click="toggle_mobile_menu"
              class="text-gray-700 hover:text-pink-600 transition-colors"
            >
              <%= if @mobile_menu_open do %>
                <.icon name="hero-x-mark" class="h-6 w-6" />
              <% else %>
                <.icon name="hero-bars-3" class="h-6 w-6" />
              <% end %>
            </button>
          </div>
        </div>
      </div>

      <%= if @mobile_menu_open do %>
        <.mobile_menu />
      <% end %>
    </nav>
    """
  end

  defp mobile_menu(assigns) do
    ~H"""
    <div class="md:hidden bg-white border-t border-gray-200 shadow-lg">
      <div class="px-4 py-2 space-y-1">
        <.mobile_nav_button section="home">
          {gettext("Home")}
        </.mobile_nav_button>
        <.mobile_nav_button section="about">
          {gettext("About")}
        </.mobile_nav_button>
        <.mobile_nav_button section="services">
          {gettext("Services")}
        </.mobile_nav_button>
        <.mobile_nav_button section="understanding">
          {gettext("Ghid Menopauză")}
        </.mobile_nav_button>
        <.mobile_nav_button section="bhrt">
          {gettext("Terapie BHRT")}
        </.mobile_nav_button>
        <.mobile_nav_button section="contact">
          {gettext("Contact")}
        </.mobile_nav_button>
      </div>
    </div>
    """
  end

  attr :section, :string, required: true
  slot :inner_block, required: true

  defp nav_button(assigns) do
    ~H"""
    <button
      phx-click="scroll_to_section"
      phx-value-section={@section}
      class="text-gray-700 hover:text-pink-600 px-3 py-2 text-sm font-medium transition-colors"
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :section, :string, required: true
  slot :inner_block, required: true

  defp mobile_nav_button(assigns) do
    ~H"""
    <button
      phx-click="scroll_to_section"
      phx-value-section={@section}
      class="block w-full text-left px-3 py-2 text-gray-700 hover:text-pink-600 hover:bg-gray-50 rounded-md transition-colors"
    >
      {render_slot(@inner_block)}
    </button>
    """
  end
end
