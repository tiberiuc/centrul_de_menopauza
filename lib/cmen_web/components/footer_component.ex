defmodule CmenWeb.FooterComponent do
  use CmenWeb, :html

  attr :class, :string, default: nil

  def footer(assigns) do
    ~H"""
    <footer class={["bg-gray-900 text-white py-12", @class]}>
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center">
          <h3 class="text-xl font-bold mb-4">
            {gettext("Centrul de Menopauză")}
          </h3>
          <p class="text-gray-400 mb-6">
            {gettext("Specialized care for menopause and women's health")}
          </p>
          <div class="border-t border-gray-700 pt-6">
            <p class="text-gray-400 text-sm">
              © 2025 {gettext("Centrul de Menopauză")}. {gettext("All rights reserved.")}
            </p>
          </div>
        </div>
      </div>
    </footer>
    """
  end
end
