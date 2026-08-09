{# Custom "Kit EcoHost" sales block. #}

{% set kit_sale_url = 'https://ecohost.net.br/produtos/kit-ecohost-flat/' %}
{% set kit_sale_price = 'Consulte o valor e formas de pagamento' %}

<section class="section-kit-sale" id="kit-ecohost" data-store="home-kit-sale">
	<div class="vibe-container">
		<div class="kit-sale-card">
			<div class="kit-sale-media">
				<img src="{{ 'images/kit-ecohost-box.png' | static_url }}" alt="{{ 'Kit EcoHost' | translate }}" />
			</div>
			<div class="kit-sale-content">
				<h2 class="kit-sale-title">{{ 'Seu EcoHost chegou!' | translate }}</h2>
				<p class="kit-sale-description">{{ 'Comece agora a economizar até 70% na conta de luz do seu Airbnb com o sistema automatizado de economia de energia da EcoHost.' | translate }}</p>
				<ul class="kit-sale-list">
					<li>
						<span class="kit-sale-check"><svg viewBox="0 0 24 24"><path d="M5 13l4 4L19 7"/></svg></span>
						{{ 'Reduz até 70% o consumo de energia da hospedagem' | translate }}
					</li>
					<li>
						<span class="kit-sale-check"><svg viewBox="0 0 24 24"><path d="M5 13l4 4L19 7"/></svg></span>
						{{ 'Instalação simples, sem obras nem fiação extra' | translate }}
					</li>
					<li>
						<span class="kit-sale-check"><svg viewBox="0 0 24 24"><path d="M5 13l4 4L19 7"/></svg></span>
						{{ 'Funciona de forma automática, sem incomodar o hóspede' | translate }}
					</li>
					<li>
						<span class="kit-sale-check"><svg viewBox="0 0 24 24"><path d="M5 13l4 4L19 7"/></svg></span>
						{{ 'Ideal para anfitriões de Airbnb e temporada' | translate }}
					</li>
				</ul>
				<div class="kit-sale-cta">
					<a href="{{ kit_sale_url }}" class="vibe-btn">{{ 'Quero o meu Kit EcoHost' | translate }}</a>
					<span class="kit-sale-price-tag">{{ kit_sale_price }}</span>
				</div>
			</div>
		</div>
	</div>
</section>
