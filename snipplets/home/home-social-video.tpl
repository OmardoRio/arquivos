{# Custom "Follow us" + brand video block.
   The video reuses settings.video_embed — set a video link on
   Theme customization > Home > Video, and it appears here automatically. #}

{% if settings.video_embed %}
	{% if '/watch?v=' in settings.video_embed %}
		{% set video_format = '/watch?v=' %}
	{% elseif '/youtu.be/' in settings.video_embed %}
		{% set video_format = '/youtu.be/' %}
	{% elseif '/shorts/' in settings.video_embed %}
		{% set video_format = '/shorts/' %}
	{% endif %}
	{% set video_id = video_format ? (settings.video_embed | split(video_format) | last) : '' %}
{% endif %}

{% if store.instagram or settings.video_embed %}
<section class="section-social-video" data-store="home-social-video">
	<div class="vibe-container">
		<div class="social-video-grid">
			<div class="social-video-panel">
				<h2>{{ 'Acompanhe a EcoHost' | translate }}</h2>
				<p>{{ 'Bastidores, novidades e dicas de economia de energia para quem vive de hospedagem.' | translate }}</p>
				{% if store.instagram %}
					<a target="_blank" rel="noopener" href="{{ store.instagram }}" class="social-video-chip">
						<svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="5"/><circle cx="12" cy="12" r="4"/><circle cx="17.2" cy="6.8" r="1.1" fill="currentColor" stroke="none"/></svg>
						{{ 'Siga a EcoHost no Instagram' | translate }}
					</a>
				{% endif %}
			</div>
			<div class="social-video-media">
				{% if video_id %}
					<iframe src="https://www.youtube.com/embed/{{ video_id }}?rel=0" title="{{ store.name }}" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen loading="lazy"></iframe>
				{% else %}
					<div class="social-video-media-empty">{{ 'Adicione um vídeo em Personalizar tema > Início > Vídeo para exibir aqui.' | translate }}</div>
				{% endif %}
			</div>
		</div>
	</div>
</section>
{% endif %}
