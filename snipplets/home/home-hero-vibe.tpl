{# Custom hero — left-aligned copy, product photo on the right.
   Upload the lifestyle/product photo as static/images/hero-product.jpg. #}

<section class="hero-vibe" data-store="home-hero-vibe">
	<div class="vibe-container">
		<div class="hero-vibe-grid">
			<div class="hero-vibe-content">
				<h1 class="hero-vibe-title">{{ 'Economize até' | translate }} <em>70%</em> {{ 'na conta de luz do seu Airbnb' | translate }}</h1>
				<p class="hero-vibe-subtitle">{{ 'A EcoHost automatiza o consumo de energia da sua hospedagem e devolve a diferença direto no seu bolso, sem complicar a experiência do hóspede.' | translate }}</p>
				<div class="hero-vibe-actions">
					<a href="https://ecohost.net.br/produtos/kit-ecohost-flat/" class="vibe-btn">
						{{ 'Quero economizar' | translate }}
						<svg class="icon-inline" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M13 6l6 6-6 6"/></svg>
					</a>
					<a href="#faq" class="vibe-btn-ghost js-hero-smooth-scroll">{{ 'Ver como funciona' | translate }}</a>
				</div>
			</div>
			<div class="hero-vibe-media">
				<img src="{{ 'images/hero-product.jpg' | static_url }}" alt="{{ store.name }}" />
			</div>
		</div>
	</div>
</section>

<script>
	(function () {
		var link = document.querySelector('.js-hero-smooth-scroll');
		if (!link) return;
		link.addEventListener('click', function (e) {
			var target = document.querySelector(link.getAttribute('href'));
			if (!target) return;
			e.preventDefault();

			var headerOffset = 90;
			var startY = window.pageYOffset;
			var endY = target.getBoundingClientRect().top + startY - headerOffset;
			var duration = 1100;
			var startTime = null;

			function easeInOutQuad(t) {
				return t < 0.5 ? 2 * t * t : 1 - Math.pow(-2 * t + 2, 2) / 2;
			}

			function step(timestamp) {
				if (!startTime) startTime = timestamp;
				var progress = Math.min((timestamp - startTime) / duration, 1);
				window.scrollTo(0, startY + (endY - startY) * easeInOutQuad(progress));
				if (progress < 1) requestAnimationFrame(step);
			}

			requestAnimationFrame(step);
		});
	})();
</script>
