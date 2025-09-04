defmodule CmenWeb.ServicesSectionComponent do
  use CmenWeb, :html

  attr :class, :string, default: nil

  def services_section(assigns) do
    ~H"""
    <section id="services" class={["py-20 bg-white", @class]}>
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
          <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
            {gettext("Serviciile Noastre")}
          </h2>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto">
            {gettext("Consultații specializate pentru menopauză și terapia hormonală bioidentică")}
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <.service_card
            title="Consultație Inițială Menopauză"
            description="Prima întâlnire cu medicul specialist, unde se discută simptomele, istoricul medical și se recomandă investigațiile necesare pentru o abordare personalizată a tratamentului."
            icon="hero-user"
            bg_color="from-pink-50 to-purple-50"
            icon_color="bg-pink-600"
            price="800 Lei"
            duration="70-80 min"
            includes={[]}
            check_color="text-pink-600"
          />

          <.service_card
            title="Consultație Inițială Menopauză – Online"
            description="Aceleași beneficii ca în consultația clasică, dar desfășurată prin video call, pentru paciente care nu pot ajunge fizic la clinică."
            icon="hero-video-camera"
            bg_color="from-green-50 to-blue-50"
            icon_color="bg-green-600"
            price="800 Lei"
            duration="70-80 min"
            includes={[]}
            check_color="text-green-600"
          />

          <.service_card
            title="Stabilire Tratament BHRT"
            description="Se realizează după consultația inițială și pe baza rezultatelor analizelor/investigațiilor recomandate. Medicul propune o schemă personalizată de terapie cu hormoni bioidentici."
            icon="hero-clipboard-document-check"
            bg_color="from-purple-50 to-indigo-50"
            icon_color="bg-purple-600"
            price="500 Lei"
            duration="30-45 min"
            includes={[]}
            check_color="text-purple-600"
          />

          <.service_card
            title="Stabilire Tratament BHRT – Online"
            description="Identic cu varianta clasică, dar realizat prin video call pe baza analizelor deja efectuate, cu recomandări personalizate."
            icon="hero-computer-desktop"
            bg_color="from-blue-50 to-cyan-50"
            icon_color="bg-blue-600"
            price="500 Lei"
            duration="30-45 min"
            includes={[]}
            check_color="text-blue-600"
          />

          <.service_card
            title="Evaluare – Control"
            description="Consultație de monitorizare după începerea tratamentului BHRT. Se verifică evoluția simptomelor și se ajustează dozele."
            icon="hero-chart-bar"
            bg_color="from-orange-50 to-amber-50"
            icon_color="bg-orange-600"
            price="300 Lei"
            duration="30 min"
            includes={[]}
            check_color="text-orange-600"
          />

          <.service_card
            title="Evaluare – Control Online"
            description="Aceleași beneficii ca evaluarea clasică, dar realizată prin video call, pentru paciente care doresc monitorizare la distanță."
            icon="hero-device-tablet"
            bg_color="from-teal-50 to-emerald-50"
            icon_color="bg-teal-600"
            price="300 Lei"
            duration="30 min"
            includes={[]}
            check_color="text-teal-600"
          />

          <.service_card
            title="Consultație Ginecologică"
            description="Examinare completă a sănătății ginecologice: evaluarea aparatului reproducător, ecografie transvaginală și recomandări specifice. (doar fizic în clinică)"
            icon="hero-heart"
            bg_color="from-rose-50 to-pink-50"
            icon_color="bg-rose-600"
            price="380 Lei"
            duration="30 min"
            includes={[]}
            check_color="text-rose-600"
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
  attr :text_color, :string, required: true

  defp simple_service_card(assigns) do
    ~H"""
    <div class={"bg-gradient-to-br #{@bg_color} rounded-xl p-8 shadow-lg hover:shadow-xl transition-shadow h-full flex flex-col"}>
      <div class={"w-16 h-16 #{@icon_color} rounded-lg flex items-center justify-center mb-6"}>
        <.icon name={@icon} class="h-8 w-8 text-white" />
      </div>
      <h3 class={"text-xl font-bold #{@text_color} mb-4"}>
        {@title}
      </h3>
      <p class="text-gray-700 leading-relaxed flex-grow">
        {@description}
      </p>
    </div>
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
      <%= if length(@includes) > 0 do %>
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
      <% else %>
        <%= if @highlight_text do %>
          <div class={"mb-6 p-3 #{@highlight_bg} rounded-lg border-l-4 #{@highlight_border}"}>
            <p class={"text-sm #{@highlight_text_color} font-medium"}>
              👉 {@highlight_text}
            </p>
          </div>
        <% end %>
      <% end %>
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
