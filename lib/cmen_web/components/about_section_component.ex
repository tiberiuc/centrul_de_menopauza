defmodule CmenWeb.AboutSectionComponent do
  use CmenWeb, :html

  attr :class, :string, default: nil

  def about_section(assigns) do
    ~H"""
    <section id="about" class={["py-20 bg-gray-50", @class]}>
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
          <div>
            <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
              {gettext("About Our Center")}
            </h2>
            <p class="text-lg text-gray-600 leading-relaxed mb-8">
              {gettext(
                "We are dedicated to providing compassionate, evidence-based care for women experiencing menopause. Our team of specialists understands the unique challenges of this life transition and offers personalized treatment plans."
              )}
            </p>
            <div class="space-y-4">
              <.feature_item text={gettext("Evidence-based treatments")} />
              <.feature_item text={gettext("Personalized care plans")} />
              <.feature_item text={gettext("Experienced specialists")} />
              <.feature_item text={gettext("Holistic approach")} />
            </div>
          </div>
          <div class="space-y-8">
            <h3 class="text-2xl font-bold text-gray-900 mb-6">
              {gettext("Echipa Noastră de Specialiști")}
            </h3>

            <.doctor_card
              name={gettext("Dr. Ioana Vasile")}
              specialty={gettext("Medic Primar Obstetrică-Ginecologie")}
              description={
                gettext(
                  "Specializată în tratamente perimenopauzale, menopauzale și postmenopauzale. Abordare profesională, empatică și personalizată pentru fiecare pacientă."
                )
              }
              image_src="/images/dr-ioana-vasile.jpg"
              specialty_color="text-pink-600"
            />

            <.doctor_card
              name={gettext("Dr. Diana Burluș")}
              specialty={gettext("Medic Specialist Obstetrică-Ginecologie")}
              description={
                gettext(
                  "Expert în menopauză, dezechilibre hormonale și terapii hormonale personalizate. Îngrijire holistică cu delicatețe, știință și respect pentru fiecare etapă a vieții feminine."
                )
              }
              image_src="/images/dr-diana-burlus.jpg"
              specialty_color="text-purple-600"
            />
          </div>
        </div>
      </div>
    </section>
    """
  end

  attr :text, :string, required: true

  defp feature_item(assigns) do
    ~H"""
    <div class="flex items-center">
      <.icon name="hero-check-circle" class="h-6 w-6 text-green-600 mr-3" />
      <span class="text-gray-700">{@text}</span>
    </div>
    """
  end

  attr :name, :string, required: true
  attr :specialty, :string, required: true
  attr :description, :string, required: true
  attr :image_src, :string, required: true
  attr :specialty_color, :string, required: true

  defp doctor_card(assigns) do
    ~H"""
    <div class="bg-white rounded-xl shadow-lg p-6 border border-gray-100">
      <div class="flex items-center space-x-4">
        <div class="w-32 h-32 rounded-full overflow-hidden flex-shrink-0">
          <img src={@image_src} alt={@name} class="w-full h-full object-cover object-top" />
        </div>
        <div class="flex-1">
          <h4 class="text-xl font-bold text-gray-900 mb-2">
            {@name}
          </h4>
          <p class={"#{@specialty_color} font-semibold mb-2"}>
            {@specialty}
          </p>
          <p class="text-sm text-gray-600 leading-relaxed">
            {@description}
          </p>
        </div>
      </div>
    </div>
    """
  end
end
