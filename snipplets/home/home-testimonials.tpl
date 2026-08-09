{% set has_home_testimonials = false %}
{% set num_testimonials = 0 %}
{% for testimonial in ['testimonial_01', 'testimonial_02', 'testimonial_03'] %}
	{% set testimonial_image = "#{testimonial}.jpg" | has_custom_image %}
	{% set testimonial_name = attribute(settings,"#{testimonial}_name") %}
	{% set testimonial_description = attribute(settings,"#{testimonial}_description") %}
	{% set has_testimonial = testimonial_name or testimonial_description or testimonial_image %}
	{% if has_testimonial %}
		{% set has_home_testimonials = true %}
		{% set num_testimonials = num_testimonials + 1 %}
	{% endif %}
{% endfor %}

{% if has_home_testimonials %}
	<section class="section-testimonials-home testimonials-premium overflow-none" data-store="home-testimonials">
		<div class="vibe-container">
			<div class="testimonials-premium-heading">
				<h2>{{ settings.testimonials_title ? settings.testimonials_title : ('O que dizem sobre a EcoHost' | translate) }}</h2>
				<p>{{ 'Anfitriões reais, economia real na conta de luz.' | translate }}</p>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="js-swiper-testimonials swiper-testimonials swiper-container">
						<div class="swiper-wrapper">
							{% set testimonial_roles = {
								'testimonial_01': 'Anfitriã em São Paulo',
								'testimonial_02': 'Anfitrião em Florianópolis',
								'testimonial_03': 'Anfitrião no Rio de Janeiro'
							} %}
							{% for testimonial in ['testimonial_01', 'testimonial_02', 'testimonial_03'] %}
								{% set testimonial_image = "#{testimonial}.jpg" | has_custom_image %}
								{% set testimonial_name = attribute(settings,"#{testimonial}_name") %}
								{% set testimonial_description = attribute(settings,"#{testimonial}_description") %}
								{% set testimonial_role = attribute(testimonial_roles, testimonial) %}
								{% set has_testimonial = testimonial_name or testimonial_description or testimonial_image %}
								{% if has_testimonial %}
									<div class="swiper-slide">
										<div class="testimonial-premium-card">
											<span class="testimonial-premium-quote">&rdquo;</span>
											<div class="testimonials-image mb-3{% if not testimonial_image %} line{% endif %}">
												{% if testimonial_image %}
													<img class="testimonials-image-background lazyload" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src='{{ "#{testimonial}.jpg" | static_url | settings_image_url("small") }}' {% if testimonial_name %}alt="{{ testimonial_name }}"{% else %}alt="{{ 'Testimonio de' | translate }} {{ store.name }}"{% endif %} />
														<div class="placeholder-fade"></div>
												{% else %}
													<svg class="icon-inline icon-lg"><use xlink:href="#quote"/></svg>
												{% endif %}
											</div>
											<div class="testimonial-premium-stars">
												{% for star in 1..5 %}
													<svg viewBox="0 0 24 24"><path d="M12 2l2.9 6.6 7.1.6-5.4 4.7 1.6 7-6.2-3.8-6.2 3.8 1.6-7-5.4-4.7 7.1-.6z"/></svg>
												{% endfor %}
											</div>
											{% if testimonial_description %}
												<p class="testimonial-premium-description{% if settings.testimonials_italic %} font-italic{% endif %}">{{ testimonial_description }}</p>
											{% endif %}
											{% if testimonial_name %}
												<h3 class="testimonial-premium-name">{{ testimonial_name }}</h3>
												{% if testimonial_role %}
													<p class="testimonial-premium-role">{{ testimonial_role }}</p>
												{% endif %}
											{% endif %}
										</div>
									</div>
								{% endif %}
							{% endfor %}
						</div>
					</div>
					{% if num_testimonials > 1 %}
						<div class="text-center mb-2">
							<div class="js-swiper-testimonials-prev swiper-button-prev svg-icon-text">
								<svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#arrow-long"/></svg>
							</div>
							<div class="js-swiper-testimonials-next swiper-button-next svg-icon-text">
								<svg class="icon-inline icon-lg"><use xlink:href="#arrow-long"/></svg>
							</div>
						</div>
					{% endif %}
				</div>
			</div>
		</div>
	</section>
{% endif %}
