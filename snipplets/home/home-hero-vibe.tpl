{# Custom hero — left-aligned copy, product photo on the right.
   Uses the kit box photo as a placeholder (images/kit-ecohost-box.png).
   Swap the filename below for a dedicated lifestyle/product photo once you have one. #}

<section class="hero-vibe" data-store="home-hero-vibe">
	<div class="vibe-container">
		<div class="hero-vibe-grid">
			<div class="hero-vibe-content">
				<h1 class="hero-vibe-title">{{ 'Economize até' | translate }} <em>70%</em> {{ 'na conta de luz do seu Airbnb' | translate }}</h1>
				<p class="hero-vibe-subtitle">{{ 'A EcoHost automatiza o consumo de energia da sua hospedagem e devolve a diferença direto no seu bolso, sem complicar a experiência do hóspede.' | translate }}</p>
				<div class="hero-vibe-actions">
					<a href="#kit-ecohost" class="vibe-btn">
						{{ 'Quero economizar' | translate }}
						<svg class="icon-inline" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M13 6l6 6-6 6"/></svg>
					</a>
					<a href="#kit-ecohost" class="vibe-btn-ghost">{{ 'Ver como funciona' | translate }}</a>
				</div>
			</div>
			<div class="hero-vibe-media">
				<div class="hero-vibe-media-blob"></div>
				<img src="{{ 'images/kit-ecohost-box.png' | static_url }}" alt="{{ store.name }}" />
			</div>
		</div>
	</div>
</section>
