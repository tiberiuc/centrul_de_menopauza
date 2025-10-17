defmodule CmenWeb.AboutSectionComponent do
  use CmenWeb, :html

  attr :class, :string, default: nil

  def about_section(assigns) do
    ~H"""
    <section id="about" class={["py-20 bg-gray-50", @class]}>
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-start">
          <div>
            <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
              Despre Centrul Nostru
            </h2>
            <div class="space-y-6 mb-8">
              <p class="text-lg text-gray-700 leading-relaxed">
                Suntem primul centru din Brașov dedicat exclusiv menopauzei și sănătății feminine.
              </p>
              <p class="text-lg text-gray-700 leading-relaxed">
                Echipa noastră este formată din specialiști acreditați internațional în managementul menopauzei și terapia de substituție hormonală, mereu la curent cu cele mai recente studii și recomandări medicale.
              </p>
              <p class="text-lg text-gray-700 leading-relaxed">
                Misiunea noastră este să oferim fiecărei femei echilibru, vitalitate și încredere în această etapă importantă a vieții.
              </p>
            </div>

            <div class="mb-8">
              <h4 class="text-xl font-semibold text-gray-900 mb-6">
                La noi, fiecare pacientă beneficiază de:
              </h4>
              <div class="space-y-4">
                <.detailed_feature_item
                  emoji="👩‍⚕️"
                  text="Echipă de specialiști acreditați internațional în managementul menopauzei și terapia de substituție hormonală, mereu conectați la cele mai noi ghiduri și studii medicale."
                />
                <.detailed_feature_item
                  emoji="🧬"
                  text="Abordare integrată – de la consultații și analize complete până la terapii hormonale bioidentice (BHRT) și programe de prevenție pe termen lung."
                />
                <.detailed_feature_item
                  emoji="🌿"
                  text="Tratamente moderne și sigure, adaptate nevoilor individuale."
                />
                <.detailed_feature_item
                  emoji="💖"
                  text="Suport constant, pentru ca fiecare femeie să se simtă înțeleasă, ascultată și susținută."
                />
              </div>
            </div>

            <div class="bg-blue-50 rounded-lg p-6 border-l-4 border-blue-500">
              <p class="text-blue-800 font-medium flex items-start">
                <span class="mr-3 text-lg">👉</span>
                <span>
                  Misiunea noastră este să transformăm experiența menopauzei într-o etapă de echilibru, vitalitate și încredere.
                </span>
              </p>
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
                  "Specialist acreditat international in terapia de substitutie hormonala bioidentica in perimenopauza, menopauza si postmenopauza. Experienta sa vasta, abilitatile profesionale si abordarea sa empatica, asigura pacientele ca primesc o atentie personalizata si o ingrijire medicala de inalta calitate"
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

  attr :emoji, :string, required: true
  attr :text, :string, required: true

  defp detailed_feature_item(assigns) do
    ~H"""
    <div class="flex items-start">
      <span class="text-xl mr-4 mt-1 flex-shrink-0">{@emoji}</span>
      <span class="text-gray-700 leading-relaxed">{@text}</span>
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
