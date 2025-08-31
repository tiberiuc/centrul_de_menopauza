defmodule CmenWeb.HomeLive do
  use CmenWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, active_menopause_section: "perimenopauza", mobile_menu_open: false)}
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
  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-white">
      <!-- Navigation Header -->
      <nav class="fixed top-0 w-full bg-white/95 backdrop-blur-sm border-b border-gray-100 z-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="flex justify-between items-center h-16">
            <div class="flex items-center space-x-3">
              <h1 class="text-xl font-bold text-pink-600">
                <%= gettext("Centrul de Menopauză") %>
              </h1>
              <img src="/images/aesthetic-lab-logo.png" alt="Aesthetic Lab" class="h-8" />
            </div>
            <div class="hidden md:block">
              <div class="ml-10 flex items-baseline space-x-8">
                <button
                  phx-click="scroll_to_section"
                  phx-value-section="home"
                  class="text-gray-700 hover:text-pink-600 px-3 py-2 text-sm font-medium transition-colors"
                >
                  <%= gettext("Home") %>
                </button>
                <button
                  phx-click="scroll_to_section"
                  phx-value-section="services"
                  class="text-gray-700 hover:text-pink-600 px-3 py-2 text-sm font-medium transition-colors"
                >
                  <%= gettext("Services") %>
                </button>
                <button
                  phx-click="scroll_to_section"
                  phx-value-section="understanding"
                  class="text-gray-700 hover:text-pink-600 px-3 py-2 text-sm font-medium transition-colors"
                >
                  <%= gettext("Ghid Menopauză") %>
                </button>
                <button
                  phx-click="scroll_to_section"
                  phx-value-section="bhrt"
                  class="text-gray-700 hover:text-pink-600 px-3 py-2 text-sm font-medium transition-colors"
                >
                  <%= gettext("Terapie BHRT") %>
                </button>
                <button
                  phx-click="scroll_to_section"
                  phx-value-section="about"
                  class="text-gray-700 hover:text-pink-600 px-3 py-2 text-sm font-medium transition-colors"
                >
                  <%= gettext("About") %>
                </button>
                <button
                  phx-click="scroll_to_section"
                  phx-value-section="contact"
                  class="text-gray-700 hover:text-pink-600 px-3 py-2 text-sm font-medium transition-colors"
                >
                  <%= gettext("Contact") %>
                </button>
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
        
        <!-- Mobile Menu -->
        <%= if @mobile_menu_open do %>
          <div class="md:hidden bg-white border-t border-gray-200 shadow-lg">
            <div class="px-4 py-2 space-y-1">
              <button
                phx-click="scroll_to_section"
                phx-value-section="home"
                class="block w-full text-left px-3 py-2 text-gray-700 hover:text-pink-600 hover:bg-gray-50 rounded-md transition-colors"
              >
                <%= gettext("Home") %>
              </button>
              <button
                phx-click="scroll_to_section"
                phx-value-section="services"
                class="block w-full text-left px-3 py-2 text-gray-700 hover:text-pink-600 hover:bg-gray-50 rounded-md transition-colors"
              >
                <%= gettext("Services") %>
              </button>
              <button
                phx-click="scroll_to_section"
                phx-value-section="understanding"
                class="block w-full text-left px-3 py-2 text-gray-700 hover:text-pink-600 hover:bg-gray-50 rounded-md transition-colors"
              >
                <%= gettext("Ghid Menopauză") %>
              </button>
              <button
                phx-click="scroll_to_section"
                phx-value-section="bhrt"
                class="block w-full text-left px-3 py-2 text-gray-700 hover:text-pink-600 hover:bg-gray-50 rounded-md transition-colors"
              >
                <%= gettext("Terapie BHRT") %>
              </button>
              <button
                phx-click="scroll_to_section"
                phx-value-section="about"
                class="block w-full text-left px-3 py-2 text-gray-700 hover:text-pink-600 hover:bg-gray-50 rounded-md transition-colors"
              >
                <%= gettext("About") %>
              </button>
              <button
                phx-click="scroll_to_section"
                phx-value-section="contact"
                class="block w-full text-left px-3 py-2 text-gray-700 hover:text-pink-600 hover:bg-gray-50 rounded-md transition-colors"
              >
                <%= gettext("Contact") %>
              </button>
            </div>
          </div>
        <% end %>
      </nav>

      <!-- Hero Section -->
      <section id="home" class="pt-24 bg-gradient-to-br from-pink-50 to-purple-50 py-20">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
            <div>
              <h1 class="text-4xl md:text-5xl lg:text-6xl font-bold text-gray-900 leading-tight">
                <%= gettext("Your journey to wellness starts here") %>
              </h1>
              <p class="mt-6 text-xl text-gray-600 leading-relaxed">
                <%= gettext("Specialized care for menopause and women's health") %>
              </p>
              <div class="mt-8 flex flex-col sm:flex-row gap-4">
                <button
                  phx-click="scroll_to_section"
                  phx-value-section="contact"
                  class="bg-pink-600 hover:bg-pink-700 text-white px-8 py-3 rounded-lg text-lg font-semibold transition-colors shadow-lg hover:shadow-xl"
                >
                  <%= gettext("Book Consultation") %>
                </button>
                <button
                  phx-click="scroll_to_section"
                  phx-value-section="services"
                  class="border border-pink-600 text-pink-600 hover:bg-pink-50 px-8 py-3 rounded-lg text-lg font-semibold transition-colors"
                >
                  <%= gettext("Learn More") %>
                </button>
              </div>
            </div>
            <div class="relative flex justify-center items-center p-8">
              <div class="w-80 h-80 rounded-full overflow-hidden shadow-2xl">
                <img src="/images/centrul-de-menopauza.jpeg" alt="Centrul de Menopauză" class="w-full h-full object-cover" />
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Services Section -->
      <section id="services" class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="text-center mb-16">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
              <%= gettext("Our Services") %>
            </h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto">
              <%= gettext("Comprehensive care tailored to your unique needs during menopause") %>
            </p>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- Consultație Specializată Menopauză -->
            <div class="bg-gradient-to-br from-pink-50 to-purple-50 rounded-xl p-8 shadow-lg hover:shadow-xl transition-shadow flex flex-col h-full">
              <div class="w-16 h-16 bg-pink-600 rounded-lg flex items-center justify-center mb-6">
                <.icon name="hero-user" class="h-8 w-8 text-white" />
              </div>
              <h3 class="text-xl font-bold text-gray-900 mb-4">
                <%= gettext("Consultație Specializată Menopauză") %>
              </h3>
              <p class="text-gray-600 leading-relaxed mb-4">
                <%= gettext("Consultația de menopauză merge mult mai departe decât ginecologia clasică. Menopauza nu este o boală, ci o etapă de tranziție hormonală, dar aduce schimbări importante în întreg organismul.") %>
              </p>
              <div class="flex-grow mb-6">
                <h4 class="text-sm font-semibold text-gray-800 mb-3"><%= gettext("Ce presupune o consultație de menopauză?") %></h4>
                <ul class="text-sm text-gray-600 space-y-2">
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-pink-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Evaluarea detaliată a simptomelor tipice: bufeuri, insomnie, iritabilitate, scăderea libidoului, uscăciune vaginală") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-pink-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Discuție despre riscurile pe termen lung asociate deficitului hormonal: osteoporoză, boli cardiovasculare, probleme metabolice") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-pink-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Analize hormonale și metabolice personalizate") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-pink-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Plan de tratament și prevenție: terapie de substituție hormonală (când este indicată), tratamente non-hormonale, nutriție, stil de viață") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-pink-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Colaborare interdisciplinară (endocrinologie, cardiologie, nutriție, psihologie) pentru o abordare completă a sănătății femeii") %></span>
                  </li>
                </ul>
                <div class="mt-4 p-3 bg-pink-50 rounded-lg border-l-4 border-pink-400">
                  <p class="text-sm text-pink-800 font-medium">
                    👉 <%= gettext("Este o consultație holistică, axată pe echilibrul hormonal și longevitate, nu doar pe aparatul genital.") %>
                  </p>
                </div>
              </div>
              <div class="border-t border-gray-200 pt-4 mt-auto">
                <div class="flex items-center justify-between">
                  <span class="text-2xl font-bold text-pink-600">800 Lei</span>
                  <span class="text-sm text-gray-500">70-80 min</span>
                </div>
              </div>
            </div>

            <!-- Consultație Online Menopauză -->
            <div class="bg-gradient-to-br from-green-50 to-blue-50 rounded-xl p-8 shadow-lg hover:shadow-xl transition-shadow flex flex-col h-full">
              <div class="w-16 h-16 bg-green-600 rounded-lg flex items-center justify-center mb-6">
                <.icon name="hero-video-camera" class="h-8 w-8 text-white" />
              </div>
              <h3 class="text-xl font-bold text-gray-900 mb-4">
                <%= gettext("Consultație Online Menopauză") %>
              </h3>
              <p class="text-gray-600 leading-relaxed mb-4">
                <%= gettext("Consultația online de menopauză oferă același nivel profesional ca cea fizică, adaptată pentru confortul și intimitatea propriului cămin. Ideal pentru prima evaluare sau monitorizarea evoluției simptomelor.") %>
              </p>
              <div class="flex-grow mb-6">
                <h4 class="text-sm font-semibold text-gray-800 mb-3"><%= gettext("Ce presupune consultația online de menopauză?") %></h4>
                <ul class="text-sm text-gray-600 space-y-2">
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-green-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Evaluarea detaliată a simptomelor prin chestionar online și discuție video") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-green-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Analiză a istoricului medical și a factorilor de risc") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-green-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Recomandări personalizate pentru analize hormonale și metabolice") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-green-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Plan de tratament și prevenție: terapie de substituție hormonală (când este indicată), tratamente non-hormonale, nutriție, stil de viață") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-green-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Planificarea următorilor pași: consultații de urmărire sau evaluare fizică când este necesară") %></span>
                  </li>
                </ul>
                <div class="mt-4 p-3 bg-green-50 rounded-lg border-l-4 border-green-400">
                  <p class="text-sm text-green-800 font-medium">
                    💻 <%= gettext("Consultația se desfășoară pe platformă securizată, cu confidențialitate garantată și acces din orice locație.") %>
                  </p>
                </div>
              </div>
              <div class="border-t border-gray-200 pt-4 mt-auto">
                <div class="flex items-center justify-between">
                  <span class="text-2xl font-bold text-green-600">800 Lei</span>
                  <span class="text-sm text-gray-500">70-80 min</span>
                </div>
              </div>
            </div>

            <!-- Consultație Ginecologică -->
            <div class="bg-gradient-to-br from-purple-50 to-indigo-50 rounded-xl p-8 shadow-lg hover:shadow-xl transition-shadow flex flex-col h-full">
              <div class="w-16 h-16 bg-purple-600 rounded-lg flex items-center justify-center mb-6">
                <.icon name="hero-heart" class="h-8 w-8 text-white" />
              </div>
              <h3 class="text-xl font-bold text-gray-900 mb-4">
                <%= gettext("Consultație Ginecologică") %>
              </h3>
              <p class="text-gray-600 leading-relaxed mb-4">
                <%= gettext("Examen ginecologic complet, control preventiv anual, ecografie transvaginală și consultanță pentru sănătatea reproductivă.") %>
              </p>
              <div class="flex-grow mb-6">
                <h4 class="text-sm font-semibold text-gray-800 mb-3"><%= gettext("Ce include consultația:") %></h4>
                <ul class="text-sm text-gray-600 space-y-2">
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-purple-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Examen ginecologic clinic complet") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-purple-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Ecografie transvaginală de înaltă rezoluție") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-purple-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Recoltare frotiu cervical (Pap test)") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-purple-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Evaluarea sănătății reproductive") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-purple-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Recomandări pentru investigații suplimentare") %></span>
                  </li>
                </ul>
              </div>
              <div class="border-t border-gray-200 pt-4 mt-auto">
                <div class="flex items-center justify-between">
                  <span class="text-2xl font-bold text-purple-600">380 Lei</span>
                  <span class="text-sm text-gray-500">30 min</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Understanding Menopause Section -->
      <section id="understanding" class="py-20 bg-gradient-to-br from-blue-50 to-indigo-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="text-center mb-16">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
              <%= gettext("Înțelegerea Menopauzei: Ghid Complet") %>
            </h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto mb-12">
              <%= gettext("Cunoaște etapele și schimbările prin care trece corpul femeii în această perioadă importantă de viață") %>
            </p>

            <!-- Interactive Navigation Buttons -->
            <div class="flex flex-col sm:flex-row justify-center space-y-3 sm:space-y-0 sm:space-x-4 mb-12">
              <button
                phx-click="change_menopause_section"
                phx-value-section="perimenopauza"
                class={"px-8 py-3 rounded-lg font-semibold transition-all duration-300 #{if @active_menopause_section == "perimenopauza", do: "bg-orange-500 text-white shadow-lg", else: "bg-white text-orange-500 border-2 border-orange-500 hover:bg-orange-50"}"}
              >
                <%= gettext("Perimenopauza") %>
              </button>
              <button
                phx-click="change_menopause_section"
                phx-value-section="menopauza"
                class={"px-8 py-3 rounded-lg font-semibold transition-all duration-300 #{if @active_menopause_section == "menopauza", do: "bg-red-500 text-white shadow-lg", else: "bg-white text-red-500 border-2 border-red-500 hover:bg-red-50"}"}
              >
                <%= gettext("Menopauza") %>
              </button>
              <button
                phx-click="change_menopause_section"
                phx-value-section="postmenopauza"
                class={"px-8 py-3 rounded-lg font-semibold transition-all duration-300 #{if @active_menopause_section == "postmenopauza", do: "bg-purple-500 text-white shadow-lg", else: "bg-white text-purple-500 border-2 border-purple-500 hover:bg-purple-50"}"}
              >
                <%= gettext("Postmenopauza") %>
              </button>
            </div>
          </div>

          <!-- Dynamic Content Area -->
          <div class="transition-all duration-500 ease-in-out">
            <%= case @active_menopause_section do %>
              <% "perimenopauza" -> %>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                  <!-- Placeholder cards for Perimenopauza - waiting for user content -->
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-orange-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-clock" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-4">
                      <%= gettext("Ce este Perimenopauza?") %>
                    </h3>
                    <p class="text-gray-600 mb-6 leading-relaxed">
                      <%= gettext("Perimenopauza este perioada de tranziție care începe înainte de menopauză, când ovarul începe să producă mai puțin estrogen. Poate dura între 2-10 ani și se termină când menstruația se oprește complet.") %>
                    </p>
                    
                    <div class="bg-orange-50 rounded-lg p-4">
                      <h4 class="font-semibold text-orange-800 mb-2">
                        <%= gettext("Când începe?") %>
                      </h4>
                      <p class="text-sm text-orange-700">
                        <%= gettext("De obicei între 35-45 de ani, dar poate varia. Femeile fumătoare pot intra în perimenopauză cu 1-2 ani mai devreme.") %>
                      </p>
                    </div>
                  </div>
                  
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-orange-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-chart-bar" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-6">
                      <%= gettext("Simptome Perimenopauză") %>
                    </h3>
                    
                    <div class="space-y-3">
                      <div class="flex items-center text-gray-700">
                        <span class="text-lg mr-3">🔥</span>
                        <span><%= gettext("Bufeuri de căldură") %></span>
                      </div>
                      <div class="flex items-center text-gray-700">
                        <span class="text-lg mr-3">🌙</span>
                        <span><%= gettext("Tulburări de somn") %></span>
                      </div>
                      <div class="flex items-center text-gray-700">
                        <span class="text-lg mr-3">📊</span>
                        <span><%= gettext("Menstruații neregulate") %></span>
                      </div>
                      <div class="flex items-center text-gray-700">
                        <span class="text-lg mr-3">😰</span>
                        <span><%= gettext("Schimbări de dispoziție") %></span>
                      </div>
                      <div class="flex items-center text-gray-700">
                        <span class="text-lg mr-3">💧</span>
                        <span><%= gettext("Uscăciune vaginală") %></span>
                      </div>
                      <div class="flex items-center text-gray-700">
                        <span class="text-lg mr-3">🧠</span>
                        <span><%= gettext("Probleme de concentrare") %></span>
                      </div>
                      <div class="flex items-center text-gray-700">
                        <span class="text-lg mr-3">⚖️</span>
                        <span><%= gettext("Creștere în greutate") %></span>
                      </div>
                      <div class="flex items-center text-gray-700">
                        <span class="text-lg mr-3">💔</span>
                        <span><%= gettext("Scăderea libidoului") %></span>
                      </div>
                    </div>
                  </div>
                  
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-orange-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-heart" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-6">
                      <%= gettext("Managementul Perimenopauzei") %>
                    </h3>
                    
                    <div class="mb-6">
                      <h4 class="font-semibold text-orange-800 mb-3">
                        <%= gettext("Modificări de stil de viață:") %>
                      </h4>
                      <ul class="text-sm text-gray-600 space-y-2">
                        <li class="flex items-start">
                          <span class="text-orange-500 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Dietă echilibrată rica în calciu și vitamina D") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-orange-500 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Exerciții regulate (150 min/săptămână)") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-orange-500 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Gestionarea stresului prin meditație") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-orange-500 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Evitarea alcoolului și a cafeii excessive") %></span>
                        </li>
                      </ul>
                    </div>

                    <div class="bg-orange-50 rounded-lg p-4">
                      <h4 class="font-semibold text-orange-800 mb-3">
                        <%= gettext("Opțiuni de tratament:") %>
                      </h4>
                      <ul class="text-sm text-orange-700 space-y-2">
                        <li class="flex items-start">
                          <span class="text-orange-600 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Contraceptive cu doze mici de hormoni") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-orange-600 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Antidepresive pentru bufeuri") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-orange-600 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Suplimente naturale (isoflavone)") %></span>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>

              <% "menopauza" -> %>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                  <!-- Placeholder cards for Menopauza - waiting for user content -->
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-red-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-fire" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-4">
                      <%= gettext("Ce este Menopauza?") %>
                    </h3>
                    <p class="text-gray-600 mb-6 leading-relaxed">
                      <%= gettext("Menopauza este momentul când menstruația se oprește definitiv. Este diagnosticată retrospectiv după 12 luni consecutive fără menstruație la femei peste 45 de ani.") %>
                    </p>
                    
                    <div class="mb-6">
                      <h4 class="font-semibold text-red-800 mb-2">
                        <%= gettext("Vârsta medie") %>
                      </h4>
                      <p class="text-sm text-gray-600 mb-4">
                        <%= gettext("51 de ani în România, dar poate varia între 45-55 de ani. Factori genetici, stilul de viață și starea de sănătate influențează momentul apariției.") %>
                      </p>
                    </div>

                    <div class="bg-red-50 rounded-lg p-4">
                      <h4 class="font-semibold text-red-800 mb-3">
                        <%= gettext("Tipuri de menopauză") %>
                      </h4>
                      <ul class="text-sm text-red-700 space-y-2">
                        <li class="flex items-start">
                          <span class="text-red-600 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Naturală: Proces biologic normal") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-red-600 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Chirurgicală: După îndepărtarea ovarelor") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-red-600 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Prematură: Înainte de 40 de ani") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-red-600 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Precoce: Între 40-45 de ani") %></span>
                        </li>
                      </ul>
                    </div>
                  </div>
                  
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-red-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-heart" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-6">
                      <%= gettext("Simptome Menopauză") %>
                    </h3>
                    
                    <div class="mb-6">
                      <h4 class="font-semibold text-red-800 mb-3">
                        <%= gettext("Simptome vasomotorii:") %>
                      </h4>
                      <div class="space-y-2">
                        <div class="flex items-center text-gray-700 text-sm">
                          <span class="text-base mr-3">🔥</span>
                          <span><%= gettext("Bufeuri de căldură (80% dintre femei)") %></span>
                        </div>
                        <div class="flex items-center text-gray-700 text-sm">
                          <span class="text-base mr-3">💦</span>
                          <span><%= gettext("Transpirații nocturne") %></span>
                        </div>
                        <div class="flex items-center text-gray-700 text-sm">
                          <span class="text-base mr-3">🌡️</span>
                          <span><%= gettext("Intoleranță la căldură") %></span>
                        </div>
                      </div>
                    </div>

                    <div class="mb-6">
                      <h4 class="font-semibold text-red-800 mb-3">
                        <%= gettext("Simptome genitourinare:") %>
                      </h4>
                      <div class="space-y-2">
                        <div class="flex items-center text-gray-700 text-sm">
                          <span class="text-base mr-3">💧</span>
                          <span><%= gettext("Uscăciune vaginală") %></span>
                        </div>
                        <div class="flex items-center text-gray-700 text-sm">
                          <span class="text-base mr-3">😣</span>
                          <span><%= gettext("Dureri la raporturile intime") %></span>
                        </div>
                        <div class="flex items-center text-gray-700 text-sm">
                          <span class="text-base mr-3">🚽</span>
                          <span><%= gettext("Infecții urinare frecvente") %></span>
                        </div>
                        <div class="flex items-center text-gray-700 text-sm">
                          <span class="text-base mr-3">💧</span>
                          <span><%= gettext("Incontinență urinară") %></span>
                        </div>
                      </div>
                    </div>

                    <div class="bg-red-50 rounded-lg p-4">
                      <h4 class="font-semibold text-red-800 mb-3">
                        <%= gettext("Simptome psihologice:") %>
                      </h4>
                      <div class="space-y-2">
                        <div class="flex items-center text-red-700 text-sm">
                          <span class="text-base mr-3">😔</span>
                          <span><%= gettext("Depresie și anxietate") %></span>
                        </div>
                        <div class="flex items-center text-red-700 text-sm">
                          <span class="text-base mr-3">😴</span>
                          <span><%= gettext("Insomnie") %></span>
                        </div>
                        <div class="flex items-center text-red-700 text-sm">
                          <span class="text-base mr-3">🧠</span>
                          <span><%= gettext("Ceață mentală") %></span>
                        </div>
                        <div class="flex items-center text-red-700 text-sm">
                          <span class="text-base mr-3">😤</span>
                          <span><%= gettext("Iritabilitate") %></span>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-red-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-shield-check" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-6">
                      <%= gettext("Riscuri pe Termen Lung") %>
                    </h3>
                    
                    <div class="space-y-6">
                      <div>
                        <div class="flex items-center mb-2">
                          <span class="text-lg mr-3">🦴</span>
                          <h4 class="font-semibold text-red-800"><%= gettext("Osteoporoză") %></h4>
                        </div>
                        <p class="text-sm text-gray-600 ml-8">
                          <%= gettext("Scăderea estrogenului accelerează pierderea de masă osoasă") %>
                        </p>
                      </div>

                      <div>
                        <div class="flex items-center mb-2">
                          <span class="text-lg mr-3">❤️</span>
                          <h4 class="font-semibold text-red-800"><%= gettext("Boli cardiovasculare") %></h4>
                        </div>
                        <p class="text-sm text-gray-600 ml-8">
                          <%= gettext("Riscul crește după menopauză din cauza schimbărilor hormonale") %>
                        </p>
                      </div>

                      <div>
                        <div class="flex items-center mb-2">
                          <span class="text-lg mr-3">🧠</span>
                          <h4 class="font-semibold text-red-800"><%= gettext("Demență") %></h4>
                        </div>
                        <p class="text-sm text-gray-600 ml-8">
                          <%= gettext("Risc ușor crescut, dar poate fi influențat de factori de stil de viață") %>
                        </p>
                      </div>

                      <div class="bg-red-50 rounded-lg p-4">
                        <div class="flex items-center mb-2">
                          <span class="text-lg mr-3">⚖️</span>
                          <h4 class="font-semibold text-red-800"><%= gettext("Sindrom metabolic") %></h4>
                        </div>
                        <p class="text-sm text-red-700 ml-8">
                          <%= gettext("Creșterea greutății și a riscului de diabet tip 2") %>
                        </p>
                      </div>
                    </div>
                  </div>
                </div>

              <% "postmenopauza" -> %>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                  <!-- Placeholder cards for Postmenopauza - waiting for user content -->
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-purple-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-sparkles" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-4">
                      <%= gettext("Ce este Postmenopauza?") %>
                    </h3>
                    <p class="text-gray-600 mb-6 leading-relaxed">
                      <%= gettext("Postmenopauza începe după 12 luni consecutive fără menstruație și durează restul vieții. Este perioada când nivelurile hormonale rămân constant scăzute.") %>
                    </p>
                    
                    <div class="mb-6">
                      <h4 class="font-semibold text-purple-800 mb-3">
                        <%= gettext("Etape ale postmenopauzei:") %>
                      </h4>
                      <ul class="text-sm text-gray-600 space-y-2">
                        <li class="flex items-start">
                          <span class="text-purple-500 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Postmenopauza timpurie: Primii 5 ani") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-purple-500 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Postmenopauza târzie: După 5 ani") %></span>
                        </li>
                      </ul>
                    </div>

                    <div class="bg-purple-50 rounded-lg p-4">
                      <h4 class="font-semibold text-purple-800 mb-3">
                        <%= gettext("Schimbări hormonale:") %>
                      </h4>
                      <p class="text-sm text-purple-700">
                        <%= gettext("Estrogenul scade cu 95%, progesteronul cu aproape 100%, iar testosteronul cu 50%.") %>
                      </p>
                    </div>
                  </div>
                  
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-purple-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-academic-cap" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-6">
                      <%= gettext("Managementul Postmenopauzei") %>
                    </h3>
                    
                    <div class="mb-6">
                      <div class="flex items-center mb-3">
                        <span class="text-lg mr-3">🏃‍♀️</span>
                        <h4 class="font-semibold text-purple-800"><%= gettext("Activitate fizică") %></h4>
                      </div>
                      <ul class="text-sm text-gray-600 space-y-1 ml-8">
                        <li class="flex items-start">
                          <span class="text-purple-500 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Exerciții de rezistență pentru masa osoasă") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-purple-500 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Cardio pentru sănătatea inimii") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-purple-500 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Yoga și stretching pentru flexibilitate") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-purple-500 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Echilibru și coordonare") %></span>
                        </li>
                      </ul>
                    </div>

                    <div class="mb-6">
                      <div class="flex items-center mb-3">
                        <span class="text-lg mr-3">🥗</span>
                        <h4 class="font-semibold text-purple-800"><%= gettext("Nutriție optimă") %></h4>
                      </div>
                      <ul class="text-sm text-gray-600 space-y-1 ml-8">
                        <li class="flex items-start">
                          <span class="text-purple-500 mr-2 mt-0.5">•</span>
                          <span><%= gettext("1200mg calciu zilnic") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-purple-500 mr-2 mt-0.5">•</span>
                          <span><%= gettext("800-1000 UI vitamina D") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-purple-500 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Proteine de calitate (1-1.2g/kg corp)") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-purple-500 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Omega-3 pentru sănătatea inimii") %></span>
                        </li>
                      </ul>
                    </div>

                    <div class="bg-purple-50 rounded-lg p-4">
                      <div class="flex items-center mb-3">
                        <span class="text-lg mr-3">🧘‍♀️</span>
                        <h4 class="font-semibold text-purple-800"><%= gettext("Sănătate mentală") %></h4>
                      </div>
                      <ul class="text-sm text-purple-700 space-y-1 ml-8">
                        <li class="flex items-start">
                          <span class="text-purple-600 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Menținerea conexiunilor sociale") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-purple-600 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Hobby-uri și activități creative") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-purple-600 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Managementul stresului") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-purple-600 mr-2 mt-0.5">•</span>
                          <span><%= gettext("Somn de calitate (7-9 ore)") %></span>
                        </li>
                      </ul>
                    </div>
                  </div>
                  
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-purple-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-sun" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-6">
                      <%= gettext("Monitorizare și Prevenție") %>
                    </h3>
                    
                    <div class="mb-6">
                      <h4 class="font-semibold text-purple-800 mb-4">
                        <%= gettext("Controale medicale regulate:") %>
                      </h4>
                      <div class="space-y-3">
                        <div class="flex items-center text-gray-700 text-sm">
                          <span class="text-base mr-3">🔬</span>
                          <span><%= gettext("Densitometria osoasă (la 2 ani)") %></span>
                        </div>
                        <div class="flex items-center text-gray-700 text-sm">
                          <span class="text-base mr-3">🩺</span>
                          <span><%= gettext("Screening cardiovascular anual") %></span>
                        </div>
                        <div class="flex items-center text-gray-700 text-sm">
                          <span class="text-base mr-3">🎗️</span>
                          <span><%= gettext("Mamografia anuală") %></span>
                        </div>
                        <div class="flex items-center text-gray-700 text-sm">
                          <span class="text-base mr-3">🔍</span>
                          <span><%= gettext("Examen ginecologic anual") %></span>
                        </div>
                        <div class="flex items-center text-gray-700 text-sm">
                          <span class="text-base mr-3">🩸</span>
                          <span><%= gettext("Analize de sânge periodice") %></span>
                        </div>
                      </div>
                    </div>

                    <div class="bg-purple-50 rounded-lg p-4">
                      <h4 class="font-semibold text-purple-800 mb-3">
                        <%= gettext("Semnale de alarmă:") %>
                      </h4>
                      <ul class="text-sm text-purple-700 space-y-2">
                        <li class="flex items-start">
                          <span class="text-purple-600 mr-2 mt-0.5">⚠️</span>
                          <span><%= gettext("Sângerare vaginală neașteptată") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-purple-600 mr-2 mt-0.5">⚠️</span>
                          <span><%= gettext("Dureri de piept sau dificultăți respiratorii") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-purple-600 mr-2 mt-0.5">⚠️</span>
                          <span><%= gettext("Dureri osoase persistente") %></span>
                        </li>
                        <li class="flex items-start">
                          <span class="text-purple-600 mr-2 mt-0.5">⚠️</span>
                          <span><%= gettext("Schimbări ale dispoziției severe") %></span>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
            <% end %>
          </div>
        </div>
      </section>

      <!-- BHRT Therapy Section -->
      <section id="bhrt" class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="text-center mb-16">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
              <%= gettext("Terapia de Substituție Hormonală Bioidentică (BHRT)") %>
            </h2>
            <p class="text-xl text-gray-600 max-w-4xl mx-auto">
              <%= gettext("Tratament personalizat cu hormoni naturali identici cu cei produși de organism pentru o menopauză echilibrată și sănătoasă") %>
            </p>
          </div>

          <!-- BHRT Introduction -->
          <div class="mb-20">
            <div class="bg-gradient-to-br from-green-50 to-blue-50 rounded-2xl p-8 lg:p-12">
              <h3 class="text-2xl font-bold text-gray-900 mb-6">
                <%= gettext("Ce este Terapia Hormonală Bioidentică?") %>
              </h3>
              <p class="text-lg text-gray-600 leading-relaxed mb-8">
                <%= gettext("BHRT folosește hormoni derivați din plante, identici la nivel molecular cu hormonii produși natural de corpul feminin. Spre deosebire de hormonii sintetici, hormonii bioidentici au aceeași structură chimică ca estrogenul, progesteronul și testosteronul naturali.") %>
              </p>
              
              <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                <div class="bg-white rounded-xl p-6 shadow-sm">
                  <div class="w-12 h-12 bg-green-500 rounded-lg flex items-center justify-center mb-4">
                    <span class="text-2xl">🌿</span>
                  </div>
                  <h4 class="font-semibold text-gray-900 mb-2"><%= gettext("Natural și Sigur") %></h4>
                  <p class="text-sm text-gray-600"><%= gettext("Hormoni derivați din plante, identici cu cei naturali") %></p>
                </div>
                <div class="bg-white rounded-xl p-6 shadow-sm">
                  <div class="w-12 h-12 bg-blue-500 rounded-lg flex items-center justify-center mb-4">
                    <span class="text-2xl">🎯</span>
                  </div>
                  <h4 class="font-semibold text-gray-900 mb-2"><%= gettext("Personalizat") %></h4>
                  <p class="text-sm text-gray-600"><%= gettext("Dozaj adaptat nevoilor individuale") %></p>
                </div>
                <div class="bg-white rounded-xl p-6 shadow-sm">
                  <div class="w-12 h-12 bg-purple-500 rounded-lg flex items-center justify-center mb-4">
                    <span class="text-2xl">⚖️</span>
                  </div>
                  <h4 class="font-semibold text-gray-900 mb-2"><%= gettext("Echilibrat") %></h4>
                  <p class="text-sm text-gray-600"><%= gettext("Restabilește echilibrul hormonal natural") %></p>
                </div>
                <div class="bg-white rounded-xl p-6 shadow-sm">
                  <div class="w-12 h-12 bg-pink-500 rounded-lg flex items-center justify-center mb-4">
                    <span class="text-2xl">💊</span>
                  </div>
                  <h4 class="font-semibold text-gray-900 mb-2"><%= gettext("Flexibil") %></h4>
                  <p class="text-sm text-gray-600"><%= gettext("Multiple forme de administrare") %></p>
                </div>
              </div>
            </div>
          </div>

          <!-- Hormones Used in BHRT -->
          <div class="mb-20">
            <h3 class="text-2xl font-bold text-gray-900 text-center mb-12">
              <%= gettext("Hormonii Utilizați în BHRT") %>
            </h3>
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
              <!-- Estrogen -->
              <div class="bg-pink-50 rounded-xl p-8 border border-pink-100">
                <div class="flex items-center mb-6">
                  <span class="text-3xl mr-3">🌸</span>
                  <h4 class="text-xl font-bold text-pink-800"><%= gettext("Estrogen Bioidentic") %></h4>
                </div>
                <div class="mb-4">
                  <p class="text-sm text-pink-700 font-semibold mb-2"><%= gettext("Tipuri:") %></p>
                  <p class="text-sm text-gray-600 mb-4"><%= gettext("Estradiol (E2), Estriol (E3), Estron (E1)") %></p>
                </div>
                <div class="mb-4">
                  <p class="text-sm text-pink-700 font-semibold mb-2"><%= gettext("Beneficii:") %></p>
                  <ul class="text-sm text-gray-600 space-y-1">
                    <li>• <%= gettext("Reducerea bufeurilor de căldură") %></li>
                    <li>• <%= gettext("Îmbunătățirea uscăciunii vaginale") %></li>
                    <li>• <%= gettext("Protecția densității osoase") %></li>
                    <li>• <%= gettext("Menținerea funcției cognitive") %></li>
                    <li>• <%= gettext("Îmbunătățirea calității somnului") %></li>
                  </ul>
                </div>
                <div class="bg-pink-100 rounded-lg p-3">
                  <p class="text-sm text-pink-800 font-semibold mb-1"><%= gettext("Forme disponibile:") %></p>
                  <p class="text-sm text-pink-700"><%= gettext("Gel, plasturi, tablete, ovule vaginale") %></p>
                </div>
              </div>

              <!-- Progesterone -->
              <div class="bg-purple-50 rounded-xl p-8 border border-purple-100">
                <div class="flex items-center mb-6">
                  <span class="text-3xl mr-3">🌙</span>
                  <h4 class="text-xl font-bold text-purple-800"><%= gettext("Progesteron Bioidentic") %></h4>
                </div>
                <div class="mb-4">
                  <p class="text-sm text-purple-700 font-semibold mb-2"><%= gettext("Rolul:") %></p>
                  <p class="text-sm text-gray-600 mb-4"><%= gettext("Echilibrează efectele estrogenului și protejează endometrul") %></p>
                </div>
                <div class="mb-4">
                  <p class="text-sm text-purple-700 font-semibold mb-2"><%= gettext("Beneficii:") %></p>
                  <ul class="text-sm text-gray-600 space-y-1">
                    <li>• <%= gettext("Îmbunătățirea calității somnului") %></li>
                    <li>• <%= gettext("Reducerea anxietății") %></li>
                    <li>• <%= gettext("Protecția împotriva cancerului endometrial") %></li>
                    <li>• <%= gettext("Stabilizarea dispoziției") %></li>
                    <li>• <%= gettext("Reducerea retenției de apă") %></li>
                  </ul>
                </div>
                <div class="bg-purple-100 rounded-lg p-3">
                  <p class="text-sm text-purple-800 font-semibold mb-1"><%= gettext("Forme disponibile:") %></p>
                  <p class="text-sm text-purple-700"><%= gettext("Capsule orale, gel, ovule vaginale") %></p>
                </div>
              </div>

              <!-- Testosterone -->
              <div class="bg-orange-50 rounded-xl p-8 border border-orange-100">
                <div class="flex items-center mb-6">
                  <span class="text-3xl mr-3">💪</span>
                  <h4 class="text-xl font-bold text-orange-800"><%= gettext("Testosteron Bioidentic") %></h4>
                </div>
                <div class="mb-4">
                  <p class="text-sm text-orange-700 font-semibold mb-2"><%= gettext("Pentru femei:") %></p>
                  <p class="text-sm text-gray-600 mb-4"><%= gettext("Doze mici pentru echilibrul hormonal") %></p>
                </div>
                <div class="mb-4">
                  <p class="text-sm text-orange-700 font-semibold mb-2"><%= gettext("Beneficii:") %></p>
                  <ul class="text-sm text-gray-600 space-y-1">
                    <li>• <%= gettext("Creșterea libidoului") %></li>
                    <li>• <%= gettext("Îmbunătățirea energiei") %></li>
                    <li>• <%= gettext("Menținerea masei musculare") %></li>
                    <li>• <%= gettext("Îmbunătățirea dispoziției") %></li>
                    <li>• <%= gettext("Creșterea densității osoase") %></li>
                  </ul>
                </div>
                <div class="bg-orange-100 rounded-lg p-3">
                  <p class="text-sm text-orange-800 font-semibold mb-1"><%= gettext("Forme disponibile:") %></p>
                  <p class="text-sm text-orange-700"><%= gettext("Gel, creme, pellete subcutanate") %></p>
                </div>
              </div>
            </div>
          </div>

          <!-- Treatment Process -->
          <div class="mb-20">
            <h3 class="text-2xl font-bold text-gray-900 text-center mb-12">
              <%= gettext("Procesul de Tratament BHRT") %>
            </h3>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
              <div class="relative h-full">
                <div class="bg-gradient-to-br from-blue-500 to-blue-600 text-white rounded-xl p-6 h-full flex flex-col">
                  <div class="text-center mb-4">
                    <div class="w-12 h-12 bg-white bg-opacity-20 rounded-full flex items-center justify-center mx-auto mb-4">
                      <span class="text-xl font-bold">1</span>
                    </div>
                    <h4 class="font-semibold mb-3"><%= gettext("Evaluare Inițială Comprehensivă") %></h4>
                  </div>
                  <ul class="text-sm space-y-2 flex-grow">
                    <li>• <%= gettext("Anamneza medicală detaliată") %></li>
                    <li>• <%= gettext("Evaluarea simptomelor curente") %></li>
                    <li>• <%= gettext("Examen fizic complet") %></li>
                    <li>• <%= gettext("Analiza istoricului familial") %></li>
                  </ul>
                </div>
              </div>

              <div class="relative h-full">
                <div class="bg-gradient-to-br from-green-500 to-green-600 text-white rounded-xl p-6 h-full flex flex-col">
                  <div class="text-center mb-4">
                    <div class="w-12 h-12 bg-white bg-opacity-20 rounded-full flex items-center justify-center mx-auto mb-4">
                      <span class="text-xl font-bold">2</span>
                    </div>
                    <h4 class="font-semibold mb-3"><%= gettext("Analize Hormonale Complete") %></h4>
                  </div>
                  <ul class="text-sm space-y-2 flex-grow">
                    <li>• <%= gettext("Estradiol, Progesterone, Testosterone") %></li>
                    <li>• <%= gettext("FSH, LH pentru confirmarea menopauzei") %></li>
                    <li>• <%= gettext("Hormoni tiroidieni (TSH, T3, T4)") %></li>
                    <li>• <%= gettext("Cortizol, DHEA-S, Insulin") %></li>
                  </ul>
                </div>
              </div>

              <div class="relative h-full">
                <div class="bg-gradient-to-br from-purple-500 to-purple-600 text-white rounded-xl p-6 h-full flex flex-col">
                  <div class="text-center mb-4">
                    <div class="w-12 h-12 bg-white bg-opacity-20 rounded-full flex items-center justify-center mx-auto mb-4">
                      <span class="text-xl font-bold">3</span>
                    </div>
                    <h4 class="font-semibold mb-3"><%= gettext("Personalizarea Tratamentului") %></h4>
                  </div>
                  <ul class="text-sm space-y-2 flex-grow">
                    <li>• <%= gettext("Interpretarea rezultatelor analizelor") %></li>
                    <li>• <%= gettext("Stabilirea dozajelor personalizate") %></li>
                    <li>• <%= gettext("Alegerea formei de administrare") %></li>
                    <li>• <%= gettext("Planul de monitorizare") %></li>
                  </ul>
                </div>
              </div>

              <div class="relative h-full">
                <div class="bg-gradient-to-br from-pink-500 to-pink-600 text-white rounded-xl p-6 h-full flex flex-col">
                  <div class="text-center mb-4">
                    <div class="w-12 h-12 bg-white bg-opacity-20 rounded-full flex items-center justify-center mx-auto mb-4">
                      <span class="text-xl font-bold">4</span>
                    </div>
                    <h4 class="font-semibold mb-3"><%= gettext("Monitorizare și Ajustări") %></h4>
                  </div>
                  <ul class="text-sm space-y-2 flex-grow">
                    <li>• <%= gettext("Control la 6-8 săptămâni") %></li>
                    <li>• <%= gettext("Analize de monitorizare la 3 luni") %></li>
                    <li>• <%= gettext("Ajustări dozaj după necesități") %></li>
                    <li>• <%= gettext("Controale regulate la 6 luni") %></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <!-- Administration Forms -->
          <div class="mb-20">
            <h3 class="text-2xl font-bold text-gray-900 text-center mb-12">
              <%= gettext("Forme de Administrare BHRT") %>
            </h3>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
              <div class="bg-white border border-gray-200 rounded-xl p-6 hover:shadow-lg transition-shadow">
                <div class="text-center mb-4">
                  <span class="text-4xl mb-3 block">💊</span>
                  <h4 class="font-semibold text-gray-900"><%= gettext("Capsule Orale") %></h4>
                </div>
                <div class="space-y-2 text-sm">
                  <p><strong class="text-green-600"><%= gettext("Avantaje:") %></strong> <%= gettext("Convenabile, dozaj precis") %></p>
                  <p><strong class="text-orange-600"><%= gettext("Dezavantaje:") %></strong> <%= gettext("Metabolism hepatic") %></p>
                  <p><strong class="text-blue-600"><%= gettext("Ideal pentru:") %></strong> <%= gettext("Progesterone") %></p>
                </div>
              </div>

              <div class="bg-white border border-gray-200 rounded-xl p-6 hover:shadow-lg transition-shadow">
                <div class="text-center mb-4">
                  <span class="text-4xl mb-3 block">🧴</span>
                  <h4 class="font-semibold text-gray-900"><%= gettext("Geluri și Creme") %></h4>
                </div>
                <div class="space-y-2 text-sm">
                  <p><strong class="text-green-600"><%= gettext("Avantaje:") %></strong> <%= gettext("Absorbție directă, evită ficatul") %></p>
                  <p><strong class="text-orange-600"><%= gettext("Dezavantaje:") %></strong> <%= gettext("Aplicare zilnică") %></p>
                  <p><strong class="text-blue-600"><%= gettext("Ideal pentru:") %></strong> <%= gettext("Estrogen, Testosterone") %></p>
                </div>
              </div>

              <div class="bg-white border border-gray-200 rounded-xl p-6 hover:shadow-lg transition-shadow">
                <div class="text-center mb-4">
                  <span class="text-4xl mb-3 block">🏥</span>
                  <h4 class="font-semibold text-gray-900"><%= gettext("Plasturi Transdermice") %></h4>
                </div>
                <div class="space-y-2 text-sm">
                  <p><strong class="text-green-600"><%= gettext("Avantaje:") %></strong> <%= gettext("Eliberare constantă, convenabile") %></p>
                  <p><strong class="text-orange-600"><%= gettext("Dezavantaje:") %></strong> <%= gettext("Posibile iritații locale") %></p>
                  <p><strong class="text-blue-600"><%= gettext("Ideal pentru:") %></strong> <%= gettext("Estrogen") %></p>
                </div>
              </div>
            </div>
          </div>

          <!-- Safety Information -->
          <div class="mb-20">
            <h3 class="text-2xl font-bold text-gray-900 text-center mb-12">
              <%= gettext("Siguranța și Contraindicațiile BHRT") %>
            </h3>
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
              <!-- Ideal Candidates -->
              <div class="bg-green-50 rounded-xl p-8 border border-green-200">
                <div class="flex items-center mb-6">
                  <span class="text-3xl mr-3">✅</span>
                  <h4 class="text-xl font-bold text-green-800"><%= gettext("Candidați Ideali pentru BHRT") %></h4>
                </div>
                <ul class="space-y-3 text-green-700">
                  <li class="flex items-start">
                    <span class="text-green-500 mr-2 mt-1">•</span>
                    <span><%= gettext("Femei în peri/menopauză cu simptome") %></span>
                  </li>
                  <li class="flex items-start">
                    <span class="text-green-500 mr-2 mt-1">•</span>
                    <span><%= gettext("Dorința pentru tratament natural") %></span>
                  </li>
                  <li class="flex items-start">
                    <span class="text-green-500 mr-2 mt-1">•</span>
                    <span><%= gettext("Lipsa contraindicațiilor majore") %></span>
                  </li>
                  <li class="flex items-start">
                    <span class="text-green-500 mr-2 mt-1">•</span>
                    <span><%= gettext("Angajament pentru monitorizare regulată") %></span>
                  </li>
                </ul>
              </div>

              <!-- Contraindications -->
              <div class="bg-red-50 rounded-xl p-8 border border-red-200">
                <div class="flex items-center mb-6">
                  <span class="text-3xl mr-3">⚠️</span>
                  <h4 class="text-xl font-bold text-red-800"><%= gettext("Contraindicații și Precauții") %></h4>
                </div>
                <ul class="space-y-3 text-red-700">
                  <li class="flex items-start">
                    <span class="text-red-500 mr-2 mt-1">•</span>
                    <span><%= gettext("Istoric de cancer hormono-dependent") %></span>
                  </li>
                  <li class="flex items-start">
                    <span class="text-red-500 mr-2 mt-1">•</span>
                    <span><%= gettext("Boli hepatice severe active") %></span>
                  </li>
                  <li class="flex items-start">
                    <span class="text-red-500 mr-2 mt-1">•</span>
                    <span><%= gettext("Tromboembolism verios netratat") %></span>
                  </li>
                  <li class="flex items-start">
                    <span class="text-red-500 mr-2 mt-1">•</span>
                    <span><%= gettext("Sângerări vaginale neexplicate") %></span>
                  </li>
                  <li class="flex items-start">
                    <span class="text-red-500 mr-2 mt-1">•</span>
                    <span><%= gettext("Sarcină și alăptarea") %></span>
                  </li>
                </ul>
              </div>

              <!-- Required Monitoring -->
              <div class="bg-blue-50 rounded-xl p-8 border border-blue-200">
                <div class="flex items-center mb-6">
                  <span class="text-3xl mr-3">🔍</span>
                  <h4 class="text-xl font-bold text-blue-800"><%= gettext("Monitorizare Necesară") %></h4>
                </div>
                <ul class="space-y-3 text-blue-700">
                  <li class="flex items-start">
                    <span class="text-blue-500 mr-2 mt-1">•</span>
                    <span><%= gettext("Analize hormonale regulate") %></span>
                  </li>
                  <li class="flex items-start">
                    <span class="text-blue-500 mr-2 mt-1">•</span>
                    <span><%= gettext("Controale ginecologice anuale") %></span>
                  </li>
                  <li class="flex items-start">
                    <span class="text-blue-500 mr-2 mt-1">•</span>
                    <span><%= gettext("Mamografie anuală") %></span>
                  </li>
                  <li class="flex items-start">
                    <span class="text-blue-500 mr-2 mt-1">•</span>
                    <span><%= gettext("Monitorizarea tensiunii arteriale") %></span>
                  </li>
                  <li class="flex items-start">
                    <span class="text-blue-500 mr-2 mt-1">•</span>
                    <span><%= gettext("Teste funcții hepatice") %></span>
                  </li>
                </ul>
              </div>
            </div>
          </div>

          <!-- CTA Section -->
          <div class="bg-gradient-to-br from-pink-600 to-purple-600 rounded-2xl p-8 lg:p-12 text-center text-white">
            <h3 class="text-2xl font-bold mb-4">
              <%= gettext("Ești pregătită pentru BHRT?") %>
            </h3>
            <p class="text-lg mb-8 max-w-3xl mx-auto opacity-90">
              <%= gettext("Descoperă dacă terapia hormonală bioidentică este potrivită pentru tine. Programează o consultație pentru evaluare comprehensivă și plan de tratament personalizat.") %>
            </p>
            <button
              phx-click="scroll_to_section"
              phx-value-section="contact"
              class="bg-white text-pink-600 hover:bg-gray-50 px-8 py-3 rounded-lg text-lg font-semibold transition-colors shadow-lg hover:shadow-xl"
            >
              <%= gettext("Consultație BHRT") %>
            </button>
          </div>
        </div>
      </section>

      <!-- About Section -->
      <section id="about" class="py-20 bg-gray-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
            <div>
              <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
                <%= gettext("About Our Center") %>
              </h2>
              <p class="text-lg text-gray-600 leading-relaxed mb-8">
                <%= gettext("We are dedicated to providing compassionate, evidence-based care for women experiencing menopause. Our team of specialists understands the unique challenges of this life transition and offers personalized treatment plans.") %>
              </p>
              <div class="space-y-4">
                <div class="flex items-center">
                  <.icon name="hero-check-circle" class="h-6 w-6 text-green-600 mr-3" />
                  <span class="text-gray-700"><%= gettext("Evidence-based treatments") %></span>
                </div>
                <div class="flex items-center">
                  <.icon name="hero-check-circle" class="h-6 w-6 text-green-600 mr-3" />
                  <span class="text-gray-700"><%= gettext("Personalized care plans") %></span>
                </div>
                <div class="flex items-center">
                  <.icon name="hero-check-circle" class="h-6 w-6 text-green-600 mr-3" />
                  <span class="text-gray-700"><%= gettext("Experienced specialists") %></span>
                </div>
                <div class="flex items-center">
                  <.icon name="hero-check-circle" class="h-6 w-6 text-green-600 mr-3" />
                  <span class="text-gray-700"><%= gettext("Holistic approach") %></span>
                </div>
              </div>
            </div>
            <div class="space-y-8">
              <h3 class="text-2xl font-bold text-gray-900 mb-6">
                <%= gettext("Echipa Noastră de Specialiști") %>
              </h3>
              
              <!-- Dr. Ioana Vasile -->
              <div class="bg-white rounded-xl shadow-lg p-6 border border-gray-100">
                <div class="flex items-center space-x-4">
                  <div class="w-32 h-32 rounded-full overflow-hidden flex-shrink-0">
                    <img src="/images/dr-ioana-vasile.jpg" alt="Dr. Ioana Vasile" class="w-full h-full object-cover object-top" />
                  </div>
                  <div class="flex-1">
                    <h4 class="text-xl font-bold text-gray-900 mb-2">
                      <%= gettext("Dr. Ioana Vasile") %>
                    </h4>
                    <p class="text-pink-600 font-semibold mb-2">
                      <%= gettext("Medic Primar Obstetrică-Ginecologie") %>
                    </p>
                    <p class="text-sm text-gray-600 leading-relaxed">
                      <%= gettext("Specializată în tratamente perimenopauzale, menopauzale și postmenopauzale. Abordare profesională, empatică și personalizată pentru fiecare pacientă.") %>
                    </p>
                  </div>
                </div>
              </div>

              <!-- Dr. Diana Burlus -->
              <div class="bg-white rounded-xl shadow-lg p-6 border border-gray-100">
                <div class="flex items-center space-x-4">
                  <div class="w-32 h-32 rounded-full overflow-hidden flex-shrink-0">
                    <img src="/images/dr-diana-burlus.jpg" alt="Dr. Diana Burluș" class="w-full h-full object-cover object-top" />
                  </div>
                  <div class="flex-1">
                    <h4 class="text-xl font-bold text-gray-900 mb-2">
                      <%= gettext("Dr. Diana Burluș") %>
                    </h4>
                    <p class="text-purple-600 font-semibold mb-2">
                      <%= gettext("Medic Specialist Obstetrică-Ginecologie") %>
                    </p>
                    <p class="text-sm text-gray-600 leading-relaxed">
                      <%= gettext("Expert în menopauză, dezechilibre hormonale și terapii hormonale personalizate. Îngrijire holistică cu delicatețe, știință și respect pentru fiecare etapă a vieții feminine.") %>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Contact Section -->
      <section id="contact" class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="text-center mb-16">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
              <%= gettext("Get in Touch") %>
            </h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto">
              <%= gettext("Ready to take the next step in your wellness journey? Contact us today to schedule your consultation.") %>
            </p>
          </div>

          <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
            <!-- Contact Information -->
            <div class="space-y-8">
              <div class="flex items-start">
                <div class="w-12 h-12 bg-pink-600 rounded-lg flex items-center justify-center mr-4">
                  <.icon name="hero-phone" class="h-6 w-6 text-white" />
                </div>
                <div>
                  <h3 class="text-lg font-semibold text-gray-900 mb-2">
                    <%= gettext("Phone") %>
                  </h3>
                  <p class="text-gray-600">+40 21 123 4567</p>
                </div>
              </div>

              <div class="flex items-start">
                <div class="w-12 h-12 bg-pink-600 rounded-lg flex items-center justify-center mr-4">
                  <.icon name="hero-envelope" class="h-6 w-6 text-white" />
                </div>
                <div>
                  <h3 class="text-lg font-semibold text-gray-900 mb-2">
                    <%= gettext("Email") %>
                  </h3>
                  <p class="text-gray-600">contact@centrul-menopauza.ro</p>
                </div>
              </div>

              <div class="flex items-start">
                <div class="w-12 h-12 bg-pink-600 rounded-lg flex items-center justify-center mr-4">
                  <.icon name="hero-map-pin" class="h-6 w-6 text-white" />
                </div>
                <div>
                  <h3 class="text-lg font-semibold text-gray-900 mb-2">
                    <%= gettext("Address") %>
                  </h3>
                  <p class="text-gray-600">Bd. Magheru 15, București, România</p>
                </div>
              </div>
            </div>

            <!-- Contact Form -->
            <div class="bg-gradient-to-br from-pink-50 to-purple-50 rounded-xl p-8">
              <form class="space-y-6">
                <div>
                  <label for="name" class="block text-sm font-medium text-gray-700 mb-2">
                    <%= gettext("Name") %>
                  </label>
                  <input
                    type="text"
                    id="name"
                    name="name"
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-pink-500 focus:border-transparent"
                    placeholder={gettext("Your name")}
                  />
                </div>

                <div>
                  <label for="email" class="block text-sm font-medium text-gray-700 mb-2">
                    <%= gettext("Email") %>
                  </label>
                  <input
                    type="email"
                    id="email"
                    name="email"
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-pink-500 focus:border-transparent"
                    placeholder={gettext("Your email")}
                  />
                </div>

                <div>
                  <label for="phone" class="block text-sm font-medium text-gray-700 mb-2">
                    <%= gettext("Phone") %>
                  </label>
                  <input
                    type="tel"
                    id="phone"
                    name="phone"
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-pink-500 focus:border-transparent"
                    placeholder={gettext("Your phone number")}
                  />
                </div>

                <div>
                  <label for="message" class="block text-sm font-medium text-gray-700 mb-2">
                    <%= gettext("Message") %>
                  </label>
                  <textarea
                    id="message"
                    name="message"
                    rows="4"
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-pink-500 focus:border-transparent"
                    placeholder={gettext("How can we help you?")}
                  ></textarea>
                </div>

                <button
                  type="submit"
                  class="w-full bg-pink-600 hover:bg-pink-700 text-white px-8 py-3 rounded-lg text-lg font-semibold transition-colors shadow-lg hover:shadow-xl"
                >
                  <%= gettext("Schedule Appointment") %>
                </button>
              </form>
            </div>
          </div>
        </div>
      </section>

      <!-- Footer -->
      <footer class="bg-gray-900 text-white py-12">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="text-center">
            <h3 class="text-xl font-bold mb-4">
              <%= gettext("Centrul de Menopauză") %>
            </h3>
            <p class="text-gray-400 mb-6">
              <%= gettext("Specialized care for menopause and women's health") %>
            </p>
            <div class="border-t border-gray-700 pt-6">
              <p class="text-gray-400 text-sm">
                © 2025 <%= gettext("Centrul de Menopauză") %>. <%= gettext("All rights reserved.") %>
              </p>
            </div>
          </div>
        </div>
      </footer>
    </div>
    """
  end
end
