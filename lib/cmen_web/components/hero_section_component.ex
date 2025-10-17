defmodule CmenWeb.HeroSectionComponent do
  use CmenWeb, :html

  attr :class, :string, default: nil

  def hero_section(assigns) do
    ~H"""
    <section id="home" class={["pt-24 bg-gradient-to-br from-pink-50 to-purple-50 py-20", @class]}>
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
          <div>
            <h1 class="text-4xl md:text-5xl lg:text-6xl font-bold text-gray-900 leading-tight">
              {gettext("Primul centru din Brașov dedicat menopauzei și sănătății feminine")}
            </h1>
            <p class="mt-6 text-xl text-gray-600 leading-relaxed">
              {gettext("Fondat în 2023 - un loc în care femeile își găsesc echilibrul, încrederea și vitalitatea")}
            </p>
            <div class="mt-8 flex flex-col sm:flex-row gap-4">
              <button
                phx-click="scroll_to_section"
                phx-value-section="contact"
                class="bg-pink-600 hover:bg-pink-700 text-white px-8 py-3 rounded-lg text-lg font-semibold transition-colors shadow-lg hover:shadow-xl"
              >
                {gettext("Book Consultation")}
              </button>
              <button
                phx-click="scroll_to_section"
                phx-value-section="services"
                class="border border-pink-600 text-pink-600 hover:bg-pink-50 px-8 py-3 rounded-lg text-lg font-semibold transition-colors"
              >
                {gettext("Learn More")}
              </button>
            </div>
          </div>
          <div class="relative flex justify-center items-center p-12">
            <div class="w-64 h-64 md:w-96 md:h-96 rounded-full overflow-hidden shadow-2xl bg-white p-8">
              <div class="w-full h-full overflow-hidden">
                <img
                  src="/images/centrul-de-menopauza.jpeg"
                  alt="Centrul de Menopauză"
                  class="w-full h-full object-cover object-bottom"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
