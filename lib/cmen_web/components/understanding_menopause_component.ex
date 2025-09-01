defmodule CmenWeb.UnderstandingMenopauseComponent do
  use CmenWeb, :html

  attr :active_menopause_section, :string, required: true
  attr :class, :string, default: nil

  def understanding_menopause_section(assigns) do
    ~H"""
    <section id="understanding" class={["py-20 bg-gradient-to-br from-blue-50 to-indigo-50", @class]}>
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
          <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
            {gettext("Înțelegerea Menopauzei: Ghid Complet")}
          </h2>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto mb-12">
            {gettext(
              "Cunoaște etapele și schimbările prin care trece corpul femeii în această perioadă importantă de viață"
            )}
          </p>

          <.navigation_buttons active_section={@active_menopause_section} />
        </div>

        <div class="transition-all duration-500 ease-in-out">
          <%= case @active_menopause_section do %>
            <% "perimenopauza" -> %>
              <.perimenopause_content />
            <% "menopauza" -> %>
              <.menopause_content />
            <% "postmenopauza" -> %>
              <.postmenopause_content />
          <% end %>
        </div>
      </div>
    </section>
    """
  end

  attr :active_section, :string, required: true

  defp navigation_buttons(assigns) do
    ~H"""
    <div class="flex flex-col sm:flex-row justify-center space-y-3 sm:space-y-0 sm:space-x-4 mb-12">
      <button
        phx-click="change_menopause_section"
        phx-value-section="perimenopauza"
        class={"px-8 py-3 rounded-lg font-semibold transition-all duration-300 #{if @active_section == "perimenopauza", do: "bg-orange-500 text-white shadow-lg", else: "bg-white text-orange-500 border-2 border-orange-500 hover:bg-orange-50"}"}
      >
        {gettext("Perimenopauza")}
      </button>
      <button
        phx-click="change_menopause_section"
        phx-value-section="menopauza"
        class={"px-8 py-3 rounded-lg font-semibold transition-all duration-300 #{if @active_section == "menopauza", do: "bg-red-500 text-white shadow-lg", else: "bg-white text-red-500 border-2 border-red-500 hover:bg-red-50"}"}
      >
        {gettext("Menopauza")}
      </button>
      <button
        phx-click="change_menopause_section"
        phx-value-section="postmenopauza"
        class={"px-8 py-3 rounded-lg font-semibold transition-all duration-300 #{if @active_section == "postmenopauza", do: "bg-purple-500 text-white shadow-lg", else: "bg-white text-purple-500 border-2 border-purple-500 hover:bg-purple-50"}"}
      >
        {gettext("Postmenopauza")}
      </button>
    </div>
    """
  end

  defp perimenopause_content(assigns) do
    ~H"""
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
      <.menopause_card
        icon="hero-clock"
        icon_color="bg-orange-500"
        title={gettext("Ce este Perimenopauza?")}
        description={
          gettext(
            "Perimenopauza este perioada de tranziție care începe înainte de menopauză, când ovarul începe să producă mai puțin estrogen. Poate dura între 2-10 ani și se termină când menstruația se oprește complet."
          )
        }
        highlight_title={gettext("Când începe?")}
        highlight_text={
          gettext(
            "De obicei între 35-45 de ani, dar poate varia. Femeile fumătoare pot intra în perimenopauză cu 1-2 ani mai devreme."
          )
        }
        highlight_bg="bg-orange-50"
        highlight_text_color="text-orange-700"
      />

      <.menopause_card
        icon="hero-chart-bar"
        icon_color="bg-orange-500"
        title={gettext("Simptome Perimenopauză")}
      >
        <div class="space-y-3">
          <.symptom_item emoji="🔥" text={gettext("Bufeuri de căldură")} />
          <.symptom_item emoji="🌙" text={gettext("Tulburări de somn")} />
          <.symptom_item emoji="📊" text={gettext("Menstruații neregulate")} />
          <.symptom_item emoji="😰" text={gettext("Schimbări de dispoziție")} />
          <.symptom_item emoji="💧" text={gettext("Uscăciune vaginală")} />
          <.symptom_item emoji="🧠" text={gettext("Probleme de concentrare")} />
          <.symptom_item emoji="⚖️" text={gettext("Creștere în greutate")} />
          <.symptom_item emoji="💔" text={gettext("Scăderea libidoului")} />
        </div>
      </.menopause_card>

      <.menopause_card
        icon="hero-heart"
        icon_color="bg-orange-500"
        title={gettext("Managementul Perimenopauzei")}
      >
        <div class="mb-6">
          <h4 class="font-semibold text-orange-800 mb-3">
            {gettext("Modificări de stil de viață:")}
          </h4>
          <ul class="text-sm text-gray-600 space-y-2">
            <li class="flex items-start">
              <span class="text-orange-500 mr-2 mt-0.5">•</span>
              <span>{gettext("Dietă echilibrată rica în calciu și vitamina D")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-orange-500 mr-2 mt-0.5">•</span>
              <span>{gettext("Exerciții regulate (150 min/săptămână)")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-orange-500 mr-2 mt-0.5">•</span>
              <span>{gettext("Gestionarea stresului prin meditație")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-orange-500 mr-2 mt-0.5">•</span>
              <span>{gettext("Evitarea alcoolului și a cafeii excessive")}</span>
            </li>
          </ul>
        </div>

        <div class="bg-orange-50 rounded-lg p-4">
          <h4 class="font-semibold text-orange-800 mb-3">
            {gettext("Opțiuni de tratament:")}
          </h4>
          <ul class="text-sm text-orange-700 space-y-2">
            <li class="flex items-start">
              <span class="text-orange-600 mr-2 mt-0.5">•</span>
              <span>{gettext("Contraceptive cu doze mici de hormoni")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-orange-600 mr-2 mt-0.5">•</span>
              <span>{gettext("Antidepresive pentru bufeuri")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-orange-600 mr-2 mt-0.5">•</span>
              <span>{gettext("Suplemente naturale (isoflavone)")}</span>
            </li>
          </ul>
        </div>
      </.menopause_card>
    </div>
    """
  end

  defp menopause_content(assigns) do
    ~H"""
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
      <.menopause_card
        icon="hero-fire"
        icon_color="bg-red-500"
        title={gettext("Ce este Menopauza?")}
        description={
          gettext(
            "Menopauza este momentul când menstruația se oprește definitiv. Este diagnosticată retrospectiv după 12 luni consecutive fără menstruație la femei peste 45 de ani."
          )
        }
        highlight_title={gettext("Vârsta medie")}
        highlight_text={
          gettext(
            "51 de ani în România, dar poate varia între 45-55 de ani. Factori genetici, stilul de viață și starea de sănătate influențează momentul apariției."
          )
        }
        highlight_bg="bg-red-50"
        highlight_text_color="text-red-700"
      >
        <div class="bg-red-50 rounded-lg p-4">
          <h4 class="font-semibold text-red-800 mb-3">
            {gettext("Tipuri de menopauză")}
          </h4>
          <ul class="text-sm text-red-700 space-y-2">
            <li class="flex items-start">
              <span class="text-red-600 mr-2 mt-0.5">•</span>
              <span>{gettext("Naturală: Proces biologic normal")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-red-600 mr-2 mt-0.5">•</span>
              <span>{gettext("Chirurgicală: După îndepărtarea ovarelor")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-red-600 mr-2 mt-0.5">•</span>
              <span>{gettext("Prematură: Înainte de 40 de ani")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-red-600 mr-2 mt-0.5">•</span>
              <span>{gettext("Precoce: Între 40-45 de ani")}</span>
            </li>
          </ul>
        </div>
      </.menopause_card>

      <.menopause_card
        icon="hero-heart"
        icon_color="bg-red-500"
        title={gettext("Simptome Menopauză")}
      >
        <div class="mb-6">
          <h4 class="font-semibold text-red-800 mb-3">
            {gettext("Simptome vasomotorii:")}
          </h4>
          <div class="space-y-2">
            <.symptom_item_small emoji="🔥" text={gettext("Bufeuri de căldură (80% dintre femei)")} />
            <.symptom_item_small emoji="💦" text={gettext("Transpirații nocturne")} />
            <.symptom_item_small emoji="🌡️" text={gettext("Intoleranță la căldură")} />
          </div>
        </div>

        <div class="mb-6">
          <h4 class="font-semibold text-red-800 mb-3">
            {gettext("Simptome genitourinare:")}
          </h4>
          <div class="space-y-2">
            <.symptom_item_small emoji="💧" text={gettext("Uscăciune vaginală")} />
            <.symptom_item_small emoji="😣" text={gettext("Dureri la raporturile intime")} />
            <.symptom_item_small emoji="🚽" text={gettext("Infecții urinare frecvente")} />
            <.symptom_item_small emoji="💧" text={gettext("Incontinență urinară")} />
          </div>
        </div>

        <div class="bg-red-50 rounded-lg p-4">
          <h4 class="font-semibold text-red-800 mb-3">
            {gettext("Simptome psihologice:")}
          </h4>
          <div class="space-y-2">
            <.symptom_item_small emoji="😔" text={gettext("Depresie și anxietate")} />
            <.symptom_item_small emoji="😴" text={gettext("Insomnie")} />
            <.symptom_item_small emoji="🧠" text={gettext("Ceață mentală")} />
            <.symptom_item_small emoji="😤" text={gettext("Iritabilitate")} />
          </div>
        </div>
      </.menopause_card>

      <.menopause_card
        icon="hero-shield-check"
        icon_color="bg-red-500"
        title={gettext("Riscuri pe Termen Lung")}
      >
        <div class="space-y-6">
          <div>
            <div class="flex items-center mb-2">
              <span class="text-lg mr-3">🦴</span>
              <h4 class="font-semibold text-red-800">{gettext("Osteoporoză")}</h4>
            </div>
            <p class="text-sm text-gray-600 ml-8">
              {gettext("Scăderea estrogenului accelerează pierderea de masă osoasă")}
            </p>
          </div>

          <div>
            <div class="flex items-center mb-2">
              <span class="text-lg mr-3">❤️</span>
              <h4 class="font-semibold text-red-800">{gettext("Boli cardiovasculare")}</h4>
            </div>
            <p class="text-sm text-gray-600 ml-8">
              {gettext("Riscul crește după menopauză din cauza schimbărilor hormonale")}
            </p>
          </div>

          <div>
            <div class="flex items-center mb-2">
              <span class="text-lg mr-3">🧠</span>
              <h4 class="font-semibold text-red-800">{gettext("Demență")}</h4>
            </div>
            <p class="text-sm text-gray-600 ml-8">
              {gettext("Risc ușor crescut, dar poate fi influențat de factori de stil de viață")}
            </p>
          </div>

          <div class="bg-red-50 rounded-lg p-4">
            <div class="flex items-center mb-2">
              <span class="text-lg mr-3">⚖️</span>
              <h4 class="font-semibold text-red-800">{gettext("Sindrom metabolic")}</h4>
            </div>
            <p class="text-sm text-red-700 ml-8">
              {gettext("Creșterea greutății și a riscului de diabet tip 2")}
            </p>
          </div>
        </div>
      </.menopause_card>
    </div>
    """
  end

  defp postmenopause_content(assigns) do
    ~H"""
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
      <.menopause_card
        icon="hero-sparkles"
        icon_color="bg-purple-500"
        title={gettext("Ce este Postmenopauza?")}
        description={
          gettext(
            "Postmenopauza începe după 12 luni consecutive fără menstruație și durează restul vieții. Este perioada când nivelurile hormonale rămân constant scăzute."
          )
        }
        highlight_title={gettext("Schimbări hormonale:")}
        highlight_text={
          gettext("Estrogenul scade cu 95%, progesteronul cu aproape 100%, iar testosteronul cu 50%.")
        }
        highlight_bg="bg-purple-50"
        highlight_text_color="text-purple-700"
      >
        <div class="mb-6">
          <h4 class="font-semibold text-purple-800 mb-3">
            {gettext("Etape ale postmenopauzei:")}
          </h4>
          <ul class="text-sm text-gray-600 space-y-2">
            <li class="flex items-start">
              <span class="text-purple-500 mr-2 mt-0.5">•</span>
              <span>{gettext("Postmenopauza timpurie: Primii 5 ani")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-500 mr-2 mt-0.5">•</span>
              <span>{gettext("Postmenopauza târzie: După 5 ani")}</span>
            </li>
          </ul>
        </div>
      </.menopause_card>

      <.menopause_card
        icon="hero-academic-cap"
        icon_color="bg-purple-500"
        title={gettext("Managementul Postmenopauzei")}
      >
        <div class="mb-6">
          <div class="flex items-center mb-3">
            <span class="text-lg mr-3">🏃‍♀️</span>
            <h4 class="font-semibold text-purple-800">{gettext("Activitate fizică")}</h4>
          </div>
          <ul class="text-sm text-gray-600 space-y-1 ml-8">
            <li class="flex items-start">
              <span class="text-purple-500 mr-2 mt-0.5">•</span>
              <span>{gettext("Exerciții de rezistență pentru masa osoasă")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-500 mr-2 mt-0.5">•</span>
              <span>{gettext("Cardio pentru sănătatea inimii")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-500 mr-2 mt-0.5">•</span>
              <span>{gettext("Yoga și stretching pentru flexibilitate")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-500 mr-2 mt-0.5">•</span>
              <span>{gettext("Echilibru și coordonare")}</span>
            </li>
          </ul>
        </div>

        <div class="mb-6">
          <div class="flex items-center mb-3">
            <span class="text-lg mr-3">🥗</span>
            <h4 class="font-semibold text-purple-800">{gettext("Nutriție optimă")}</h4>
          </div>
          <ul class="text-sm text-gray-600 space-y-1 ml-8">
            <li class="flex items-start">
              <span class="text-purple-500 mr-2 mt-0.5">•</span>
              <span>{gettext("1200mg calciu zilnic")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-500 mr-2 mt-0.5">•</span>
              <span>{gettext("800-1000 UI vitamina D")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-500 mr-2 mt-0.5">•</span>
              <span>{gettext("Proteine de calitate (1-1.2g/kg corp)")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-500 mr-2 mt-0.5">•</span>
              <span>{gettext("Omega-3 pentru sănătatea inimii")}</span>
            </li>
          </ul>
        </div>

        <div class="bg-purple-50 rounded-lg p-4">
          <div class="flex items-center mb-3">
            <span class="text-lg mr-3">🧘‍♀️</span>
            <h4 class="font-semibold text-purple-800">{gettext("Sănătate mentală")}</h4>
          </div>
          <ul class="text-sm text-purple-700 space-y-1 ml-8">
            <li class="flex items-start">
              <span class="text-purple-600 mr-2 mt-0.5">•</span>
              <span>{gettext("Menținerea conexiunilor sociale")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-600 mr-2 mt-0.5">•</span>
              <span>{gettext("Hobby-uri și activități creative")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-600 mr-2 mt-0.5">•</span>
              <span>{gettext("Managementul stresului")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-600 mr-2 mt-0.5">•</span>
              <span>{gettext("Somn de calitate (7-9 ore)")}</span>
            </li>
          </ul>
        </div>
      </.menopause_card>

      <.menopause_card
        icon="hero-sun"
        icon_color="bg-purple-500"
        title={gettext("Monitorizare și Prevenție")}
      >
        <div class="mb-6">
          <h4 class="font-semibold text-purple-800 mb-4">
            {gettext("Controale medicale regulate:")}
          </h4>
          <div class="space-y-3">
            <.symptom_item_small emoji="🔬" text={gettext("Densitometria osoasă (la 2 ani)")} />
            <.symptom_item_small emoji="🩺" text={gettext("Screening cardiovascular anual")} />
            <.symptom_item_small emoji="🎗️" text={gettext("Mamografia anuală")} />
            <.symptom_item_small emoji="🔍" text={gettext("Examen ginecologic anual")} />
            <.symptom_item_small emoji="🩸" text={gettext("Analize de sânge periodice")} />
          </div>
        </div>

        <div class="bg-purple-50 rounded-lg p-4">
          <h4 class="font-semibold text-purple-800 mb-3">
            {gettext("Semnale de alarmă:")}
          </h4>
          <ul class="text-sm text-purple-700 space-y-2">
            <li class="flex items-start">
              <span class="text-purple-600 mr-2 mt-0.5">⚠️</span>
              <span>{gettext("Sângerare vaginală neașteptată")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-600 mr-2 mt-0.5">⚠️</span>
              <span>{gettext("Dureri de piept sau dificultăți respiratorii")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-600 mr-2 mt-0.5">⚠️</span>
              <span>{gettext("Dureri osoase persistente")}</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-600 mr-2 mt-0.5">⚠️</span>
              <span>{gettext("Schimbări ale dispoziției severe")}</span>
            </li>
          </ul>
        </div>
      </.menopause_card>
    </div>
    """
  end

  attr :icon, :string, required: true
  attr :icon_color, :string, required: true
  attr :title, :string, required: true
  attr :description, :string, default: nil
  attr :highlight_title, :string, default: nil
  attr :highlight_text, :string, default: nil
  attr :highlight_bg, :string, default: nil
  attr :highlight_text_color, :string, default: nil
  slot :inner_block

  defp menopause_card(assigns) do
    ~H"""
    <div class="bg-white rounded-xl p-8 shadow-lg">
      <div class={"w-16 h-16 #{@icon_color} rounded-lg flex items-center justify-center mb-6"}>
        <.icon name={@icon} class="h-8 w-8 text-white" />
      </div>
      <h3 class="text-xl font-bold text-gray-900 mb-4">
        {@title}
      </h3>
      <%= if @description do %>
        <p class="text-gray-600 mb-6 leading-relaxed">
          {@description}
        </p>
      <% end %>

      <%= if @highlight_title && @highlight_text do %>
        <div class="mb-6">
          <h4 class="font-semibold text-gray-800 mb-2">
            {@highlight_title}
          </h4>
          <p class="text-sm text-gray-600 mb-4">
            {@highlight_text}
          </p>
        </div>

        <%= if @highlight_bg do %>
          <div class={"#{@highlight_bg} rounded-lg p-4"}>
            <h4 class="font-semibold text-gray-800 mb-3">
              {@highlight_title}
            </h4>
            <p class={"text-sm #{@highlight_text_color}"}>
              {@highlight_text}
            </p>
          </div>
        <% end %>
      <% end %>

      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :emoji, :string, required: true
  attr :text, :string, required: true

  defp symptom_item(assigns) do
    ~H"""
    <div class="flex items-center text-gray-700">
      <span class="text-lg mr-3">{@emoji}</span>
      <span>{@text}</span>
    </div>
    """
  end

  attr :emoji, :string, required: true
  attr :text, :string, required: true

  defp symptom_item_small(assigns) do
    ~H"""
    <div class="flex items-center text-gray-700 text-sm">
      <span class="text-base mr-3">{@emoji}</span>
      <span>{@text}</span>
    </div>
    """
  end
end
