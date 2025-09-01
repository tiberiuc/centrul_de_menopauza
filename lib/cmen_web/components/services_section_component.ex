defmodule CmenWeb.ServicesSectionComponent do
  use CmenWeb, :html

  attr :class, :string, default: nil

  def services_section(assigns) do
    ~H"""
    <section id="services" class={["py-20 bg-white", @class]}>
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
          <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
            {gettext("Our Services")}
          </h2>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto">
            {gettext("Comprehensive care tailored to your unique needs during menopause")}
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <.service_card
            title={gettext("Consultație Specializată Menopauză")}
            description={
              gettext(
                "Consultația de menopauză merge mult mai departe decât ginecologia clasică. Menopauza nu este o boală, ci o etapă de tranziție hormonală, dar aduce schimbări importante în întreg organismul."
              )
            }
            icon="hero-user"
            bg_color="from-pink-50 to-purple-50"
            icon_color="bg-pink-600"
            price="800 Lei"
            duration="70-80 min"
            includes={[
              gettext(
                "Evaluarea detaliată a simptomelor tipice: bufeuri, insomnie, iritabilitate, scăderea libidoului, uscăciune vaginală"
              ),
              gettext(
                "Discuție despre riscurile pe termen lung asociate deficitului hormonal: osteoporoză, boli cardiovasculare, probleme metabolice"
              ),
              gettext("Analize hormonale și metabolice personalizate"),
              gettext(
                "Plan de tratament și prevenție: terapie de substituție hormonală (când este indicată), tratamente non-hormonale, nutriție, stil de viață"
              ),
              gettext(
                "Colaborare interdisciplinară (endocrinologie, cardiologie, nutriție, psihologie) pentru o abordare completă a sănătății femeii"
              )
            ]}
            check_color="text-pink-600"
            highlight_text={
              gettext(
                "Este o consultație holistică, axată pe echilibrul hormonal și longevitate, nu doar pe aparatul genital."
              )
            }
            highlight_bg="bg-pink-50"
            highlight_border="border-pink-400"
            highlight_text_color="text-pink-800"
          />

          <.service_card
            title={gettext("Consultație Online Menopauză")}
            description={
              gettext(
                "Consultația online de menopauză oferă același nivel profesional ca cea fizică, adaptată pentru confortul și intimitatea propriului cămin. Ideal pentru prima evaluare sau monitorizarea evoluției simptomelor."
              )
            }
            icon="hero-video-camera"
            bg_color="from-green-50 to-blue-50"
            icon_color="bg-green-600"
            price="800 Lei"
            duration="70-80 min"
            includes={[
              gettext("Evaluarea detaliată a simptomelor prin chestionar online și discuție video"),
              gettext("Analiză a istoricului medical și a factorilor de risc"),
              gettext("Recomandări personalizate pentru analize hormonale și metabolice"),
              gettext(
                "Plan de tratament și prevenție: terapie de substituție hormonală (când este indicată), tratamente non-hormonale, nutriție, stil de viață"
              ),
              gettext(
                "Planificarea următorilor pași: consultații de urmărire sau evaluare fizică când este necesară"
              )
            ]}
            check_color="text-green-600"
            highlight_text={
              gettext(
                "Consultația se desfășoară pe platformă securizată, cu confidențialitate garantată și acces din orice locație."
              )
            }
            highlight_bg="bg-green-50"
            highlight_border="border-green-400"
            highlight_text_color="text-green-800"
          />

          <.service_card
            title={gettext("Consultație Ginecologică")}
            description={
              gettext(
                "Examen ginecologic complet, control preventiv anual, ecografie transvaginală și consultanță pentru sănătatea reproductivă."
              )
            }
            icon="hero-heart"
            bg_color="from-purple-50 to-indigo-50"
            icon_color="bg-purple-600"
            price="380 Lei"
            duration="30 min"
            includes={[
              gettext("Examen ginecologic clinic complet"),
              gettext("Ecografie transvaginală de înaltă rezoluție"),
              gettext("Recoltare frotiu cervical (Pap test)"),
              gettext("Evaluarea sănătății reproductive"),
              gettext("Recomandări pentru investigații suplimentare")
            ]}
            check_color="text-purple-600"
          />
        </div>
      </div>
    </section>
    """
  end

  attr :title, :string, required: true
  attr :description, :string, required: true
  attr :icon, :string, required: true
  attr :bg_color, :string, required: true
  attr :icon_color, :string, required: true
  attr :price, :string, required: true
  attr :duration, :string, required: true
  attr :includes, :list, required: true
  attr :check_color, :string, required: true
  attr :highlight_text, :string, default: nil
  attr :highlight_bg, :string, default: nil
  attr :highlight_border, :string, default: nil
  attr :highlight_text_color, :string, default: nil

  defp service_card(assigns) do
    ~H"""
    <div class={"bg-gradient-to-br #{@bg_color} rounded-xl p-8 shadow-lg hover:shadow-xl transition-shadow flex flex-col h-full"}>
      <div class={"w-16 h-16 #{@icon_color} rounded-lg flex items-center justify-center mb-6"}>
        <.icon name={@icon} class="h-8 w-8 text-white" />
      </div>
      <h3 class="text-xl font-bold text-gray-900 mb-4">
        {@title}
      </h3>
      <p class="text-gray-600 leading-relaxed mb-4">
        {@description}
      </p>
      <div class="flex-grow mb-6">
        <h4 class="text-sm font-semibold text-gray-800 mb-3">
          <%= cond do %>
            <% String.contains?(@title, "Consultație Specializată Menopauză") -> %>
              {gettext("Ce presupune o consultație de menopauză?")}
            <% String.contains?(@title, "Consultație Online Menopauză") -> %>
              {gettext("Ce presupune consultația online de menopauză?")}
            <% true -> %>
              {gettext("Ce include consultația:")}
          <% end %>
        </h4>
        <ul class="text-sm text-gray-600 space-y-2">
          <%= for item <- @includes do %>
            <li class="flex items-start">
              <.icon name="hero-check" class={"h-4 w-4 #{@check_color} mr-2 mt-0.5 flex-shrink-0"} />
              <span>{item}</span>
            </li>
          <% end %>
        </ul>
        <%= if @highlight_text do %>
          <div class={"mt-4 p-3 #{@highlight_bg} rounded-lg border-l-4 #{@highlight_border}"}>
            <p class={"text-sm #{@highlight_text_color} font-medium"}>
              👉 {@highlight_text}
            </p>
          </div>
        <% end %>
      </div>
      <div class="border-t border-gray-200 pt-4 mt-auto">
        <div class="flex items-center justify-between">
          <span class={"text-2xl font-bold #{@check_color}"}>{@price}</span>
          <span class="text-sm text-gray-500">{@duration}</span>
        </div>
      </div>
    </div>
    """
  end
end
