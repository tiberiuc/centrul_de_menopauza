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
    <div class="max-w-4xl mx-auto">
      <.comprehensive_perimenopause_card />

    </div>
    """
  end

  defp menopause_content(assigns) do
    ~H"""
    <div class="max-w-4xl mx-auto">
      <.comprehensive_menopause_card />
    </div>
    """
  end

  defp postmenopause_content(assigns) do
    ~H"""
    <div class="max-w-4xl mx-auto">
      <.comprehensive_postmenopause_card />
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

  defp comprehensive_perimenopause_card(assigns) do
    ~H"""
    <div class="bg-white rounded-xl p-10 shadow-lg">
      <div class="w-16 h-16 bg-orange-500 rounded-lg flex items-center justify-center mb-8">
        <.icon name="hero-clock" class="h-8 w-8 text-white" />
      </div>
      <h3 class="text-2xl font-bold text-gray-900 mb-8 text-center">
        Perimenopauza
      </h3>
      
      <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-8">
        <div>
          <h4 class="text-lg font-semibold text-orange-800 mb-4">Ce este?</h4>
          <p class="text-gray-700 leading-relaxed">
            Etapa de tranziție către menopauză, în care nivelurile de estrogen și progesteron fluctuează. Fertilitatea scade treptat, dar menstruațiile nu au dispărut complet.
          </p>
        </div>
        
        <div>
          <h4 class="text-lg font-semibold text-orange-800 mb-4">Când începe?</h4>
          <p class="text-gray-700 leading-relaxed">
            Poate debuta cu 5–10 ani înainte de menopauză, de obicei în jurul vârstei de 40 de ani, uneori chiar mai devreme.
          </p>
        </div>
      </div>
      
      <div class="mb-8">
        <h4 class="text-lg font-semibold text-orange-800 mb-4">Simptome:</h4>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
          <ul class="space-y-2">
            <li class="flex items-start">
              <span class="text-orange-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">cicluri menstruale neregulate</span>
            </li>
            <li class="flex items-start">
              <span class="text-orange-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">bufeuri și transpirații nocturne</span>
            </li>
            <li class="flex items-start">
              <span class="text-orange-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">insomnie sau somn agitat</span>
            </li>
          </ul>
          <ul class="space-y-2">
            <li class="flex items-start">
              <span class="text-orange-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">schimbări bruște de dispoziție, anxietate</span>
            </li>
            <li class="flex items-start">
              <span class="text-orange-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">scăderea libidoului</span>
            </li>
            <li class="flex items-start">
              <span class="text-orange-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">sensibilitate la sâni, balonare</span>
            </li>
          </ul>
        </div>
      </div>
      
      <div class="bg-orange-50 rounded-lg p-6">
        <h4 class="text-lg font-semibold text-orange-800 mb-4">Management:</h4>
        <div class="space-y-4">
          <div>
            <p class="text-sm font-semibold text-orange-700 mb-2">Stil de viață:</p>
            <p class="text-gray-700 text-sm">dietă echilibrată, sport regulat, reducerea stresului.</p>
          </div>
          <div>
            <p class="text-sm font-semibold text-orange-700 mb-2">Suplimente:</p>
            <p class="text-gray-700 text-sm">vitamina D, magneziu, omega 3 (la nevoie, pe baza analizelor).</p>
          </div>
          <div>
            <p class="text-sm font-semibold text-orange-700 mb-2">BHRT:</p>
            <p class="text-gray-700 text-sm">doze mici de progesteron/estrogen, dacă simptomele sunt deranjante.</p>
          </div>
          <div>
            <p class="text-sm font-semibold text-orange-700 mb-2">Monitorizare:</p>
            <p class="text-gray-700 text-sm">analize hormonale și consultații periodice.</p>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp comprehensive_menopause_card(assigns) do
    ~H"""
    <div class="bg-white rounded-xl p-10 shadow-lg">
      <div class="w-16 h-16 bg-red-500 rounded-lg flex items-center justify-center mb-8">
        <.icon name="hero-fire" class="h-8 w-8 text-white" />
      </div>
      <h3 class="text-2xl font-bold text-gray-900 mb-8 text-center">
        Menopauza
      </h3>
      
      <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-8">
        <div>
          <h4 class="text-lg font-semibold text-red-800 mb-4">Ce este?</h4>
          <p class="text-gray-700 leading-relaxed">
            Momentul oficial al ultimei menstruații, confirmat după 12 luni consecutive fără menstruație.
          </p>
        </div>
        
        <div>
          <h4 class="text-lg font-semibold text-red-800 mb-4">Când începe?</h4>
          <p class="text-gray-700 leading-relaxed">
            În general între 45 și 55 de ani, vârsta medie fiind 51 de ani.
          </p>
        </div>
      </div>
      
      <div class="mb-8">
        <h4 class="text-lg font-semibold text-red-800 mb-4">Simptome:</h4>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
          <ul class="space-y-2">
            <li class="flex items-start">
              <span class="text-red-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">bufeuri frecvente și transpirații nocturne intense</span>
            </li>
            <li class="flex items-start">
              <span class="text-red-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">uscăciune vaginală și disconfort la contact</span>
            </li>
            <li class="flex items-start">
              <span class="text-red-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">scăderea energiei și a capacității de concentrare</span>
            </li>
          </ul>
          <ul class="space-y-2">
            <li class="flex items-start">
              <span class="text-red-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">creștere în greutate, mai ales abdominală</span>
            </li>
            <li class="flex items-start">
              <span class="text-red-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">piele și păr mai fragile</span>
            </li>
            <li class="flex items-start">
              <span class="text-red-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">stare de iritabilitate sau depresie</span>
            </li>
          </ul>
        </div>
      </div>
      
      <div class="bg-red-50 rounded-lg p-6">
        <h4 class="text-lg font-semibold text-red-800 mb-4">Management:</h4>
        <div class="space-y-4">
          <div>
            <p class="text-sm font-semibold text-red-700 mb-2">Terapia BHRT personalizată:</p>
            <p class="text-gray-700 text-sm">estrogen + progesteron bioidentic, +/- testosteron.</p>
          </div>
          <div>
            <p class="text-sm font-semibold text-red-700 mb-2">Tratamente locale:</p>
            <p class="text-gray-700 text-sm">ovule cu estriol sau DHEA pentru uscăciune.</p>
          </div>
          <div>
            <p class="text-sm font-semibold text-red-700 mb-2">Screening medical regulat:</p>
            <p class="text-gray-700 text-sm">mamar, ginecologic, cardiovascular.</p>
          </div>
          <div>
            <p class="text-sm font-semibold text-red-700 mb-2">Activitate fizică zilnică:</p>
            <p class="text-gray-700 text-sm">pentru controlul greutății și protecția oaselor.</p>
          </div>
          <div>
            <p class="text-sm font-semibold text-red-700 mb-2">Suport psihologic / coaching:</p>
            <p class="text-gray-700 text-sm">dacă apar anxietate sau depresie.</p>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp comprehensive_postmenopause_card(assigns) do
    ~H"""
    <div class="bg-white rounded-xl p-10 shadow-lg">
      <div class="w-16 h-16 bg-purple-500 rounded-lg flex items-center justify-center mb-8">
        <.icon name="hero-sparkles" class="h-8 w-8 text-white" />
      </div>
      <h3 class="text-2xl font-bold text-gray-900 mb-8 text-center">
        Postmenopauza
      </h3>
      
      <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-8">
        <div>
          <h4 class="text-lg font-semibold text-purple-800 mb-4">Ce este?</h4>
          <p class="text-gray-700 leading-relaxed">
            Perioada de după instalarea menopauzei, care durează pentru tot restul vieții. Nivelurile de estrogen și progesteron rămân foarte scăzute.
          </p>
        </div>
        
        <div>
          <h4 class="text-lg font-semibold text-purple-800 mb-4">Când începe?</h4>
          <p class="text-gray-700 leading-relaxed">
            La 1 an după ultima menstruație.
          </p>
        </div>
      </div>
      
      <div class="mb-8">
        <h4 class="text-lg font-semibold text-purple-800 mb-4">Simptome:</h4>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
          <ul class="space-y-2">
            <li class="flex items-start">
              <span class="text-purple-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">unele simptome de menopauză pot persista (bufeuri, insomnie)</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">risc crescut de osteoporoză și fracturi</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">risc cardiovascular mai mare (hipertensiune, infarct, AVC)</span>
            </li>
          </ul>
          <ul class="space-y-2">
            <li class="flex items-start">
              <span class="text-purple-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">scăderea masei musculare și a elasticității pielii</span>
            </li>
            <li class="flex items-start">
              <span class="text-purple-500 mr-3 mt-1 flex-shrink-0">•</span>
              <span class="text-gray-700">uscăciune vaginală persistentă și incontinență urinară</span>
            </li>
          </ul>
        </div>
      </div>
      
      <div class="bg-purple-50 rounded-lg p-6">
        <h4 class="text-lg font-semibold text-purple-800 mb-4">Management:</h4>
        <div class="space-y-4">
          <div>
            <p class="text-sm font-semibold text-purple-700 mb-2">Continuarea BHRT:</p>
            <p class="text-gray-700 text-sm">dacă este recomandată și bine tolerată.</p>
          </div>
          <div>
            <p class="text-sm font-semibold text-purple-700 mb-2">Monitorizare anuală:</p>
            <p class="text-gray-700 text-sm">analize, ecografie transvaginală, screening mamar, DEXA pentru oase.</p>
          </div>
          <div>
            <p class="text-sm font-semibold text-purple-700 mb-2">Dietă bogată în calciu și proteine:</p>
            <p class="text-gray-700 text-sm">suplimente de vitamina D și colagen.</p>
          </div>
          <div>
            <p class="text-sm font-semibold text-purple-700 mb-2">Sport regulat:</p>
            <p class="text-gray-700 text-sm">exerciții cu greutăți + mers rapid pentru sănătatea oaselor și inimii.</p>
          </div>
          <div>
            <p class="text-sm font-semibold text-purple-700 mb-2">Îngrijire vaginală continuă:</p>
            <p class="text-gray-700 text-sm">ovule, laser intim, PRP, tratamente locale.</p>
          </div>
          <div>
            <p class="text-sm font-semibold text-purple-700 mb-2">Prevenție activă:</p>
            <p class="text-gray-700 text-sm">pentru bolile cardiovasculare și cognitive.</p>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
