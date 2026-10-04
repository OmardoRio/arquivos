{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
{% set has_footer_contact_info = (store.whatsapp or store.phone or store.email or store.address or store.blog) and settings.footer_contact_show %}          

{% set has_footer_logo = "footer_logo.jpg" | has_custom_image %}
{% set has_footer_menu = settings.footer_menu and settings.footer_menu_show %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_logos = settings.shipping %}
{% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}
{% set has_languages = languages | length > 1 and settings.languages_footer %}

{% set has_seal_logos = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
{% set show_help = not has_products and not has_social_network %}

{{ component('nubesdk-slot', { type: "before_footer" }) }}

<footer class="js-footer js-hide-footer-while-scrolling display-when-content-ready overflow-none {% if settings.footer_colors %}footer-colors{% endif %}" data-store="footer">
	<div class="container text-center">
		{% if has_footer_logo and template != 'password' %}
			<div class="mb-4 pb-2">
				<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ 'footer_logo.jpg' | static_url('large') }}" alt="{{ store.name }}" title="{{ store.name }}" class="footer-logo-img lazyload">
			</div>
		{% endif %}
		{% if has_social_network %}
			<div class="mb-4">
				{% include "snipplets/social/social-links.tpl" %}
			</div>
		{% endif %}

		{% if template != 'password' %}

			{# Foot Nav #}
			{% if has_footer_menu %}
				<div class="mb-3">
					{% include "snipplets/navigation/navigation-foot.tpl" %}
				</div>
			{% endif %}

			{% if settings.news_show %}
				<div class="mb-4">
					{% include 'snipplets/newsletter.tpl' %}
				</div>
			{% endif %}
		{% endif %}

		{# Contact info #}
		{% if has_footer_contact_info %}
			<div class="mb-3">
				{% include "snipplets/contact-links.tpl" with {footer: true} %}
			</div>
		{% endif %}

		{% if template != 'password' %}

			{# Logos Payments and Shipping #}
			{% if has_shipping_payment_logos or has_languages %}
				<div class="mb-4">

					{% if has_payment_logos %}
						<div class="footer-payments-shipping-logos d-inline-block align-middle">
							{{ component('payment-shipping-logos', {'type' : 'payments'}) }}
						</div>
					{% endif %}

					{% if has_shipping_logos %}
						<div class="footer-payments-shipping-logos d-inline-block align-middle">
							{{ component('payment-shipping-logos', {'type' : 'shipping'}) }}
						</div>
					{% endif %}

				</div>
			{% endif %}

			{# Language selector #}
			{% if has_languages %}
				<a href="#" data-toggle="#languages" class="js-modal-open btn-link font-small">{{ "Idiomas y monedas" | translate }}</a>
				{% embed "snipplets/modal.tpl" with{modal_id: 'languages', modal_class: 'bottom modal-centered-small', modal_position: 'center', modal_transition: 'slide', modal_header_title: true, modal_footer: false, modal_width: 'centered', modal_zindex_top: true} %}
					{% block modal_head %}
						{{ 'Idiomas y monedas' | translate }}
					{% endblock %}
					{% block modal_body %}
						{% include "snipplets/navigation/navigation-lang.tpl" %}
					{% endblock %}
				{% endembed %}
			{% endif %}

			{# AFIP - EBIT - Custom Seal #}
			{% if has_seal_logos %}
				<div class="row text-center">
					<div class="col p-3">
						{% if store.afip or ebit %}
							{% if store.afip %}
								<div class="footer-logo afip seal-afip">
									{{ store.afip | raw }}
								</div>
							{% endif %}
							{% if ebit %}
								<div class="footer-logo ebit seal-ebit">
									{{ ebit }}
								</div>
							{% endif %}
						{% endif %}
						{% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
							{% if "seal_img.jpg" | has_custom_image %}
								<div class="footer-logo custom-seal">
									{% if settings.seal_url != '' %}
										<a href="{{ settings.seal_url | setting_url }}" target="_blank">
									{% endif %}
										<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ "seal_img.jpg" | static_url }}" class="custom-seal-img lazyload" alt="{{ 'Sello de' | translate }} {{ store.name }}"/>
									{% if settings.seal_url != '' %}
										</a>
									{% endif %}
								</div>
							{% endif %}
							{% if settings.custom_seal_code %}
								<div class="custom-seal custom-seal-code">
									{{ settings.custom_seal_code | raw }}
								</div>
							{% endif %}
						{% endif %}

						{{ component('nubesdk-slot', { type: "footer_seals" }) }}

					</div>
				</div>
			{% endif %}
		{% endif %}

		{{ component('nubesdk-slot', { type: "inside_footer" }) }}

		<div class="my-2">
			{#
			La leyenda que aparece debajo de esta linea de código debe mantenerse
			con las mismas palabras y con su apropiado link a Tienda Nube;
			como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
			Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
			tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
			Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
			palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
			http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
			e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
			manter visivél e com um link funcionando.
			#}
			{{ new_powered_by_link }}
		</div>
		<div class="d-inline-block mr-md-2 font-smallest">
			{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
		</div>

		{# Terms & Conditions modal (custom - replaces the removed standalone page) #}
		<div class="d-inline-block mr-md-2 font-smallest">
			<a href="#" data-toggle="#terms-conditions" class="js-modal-open btn-link font-smallest">{{ 'Termos & Condições' | translate }}</a>
		</div>
		{% embed "snipplets/modal.tpl" with{modal_id: 'terms-conditions', modal_class: 'terms-conditions-modal bottom modal-centered-small', modal_position: 'center', modal_transition: 'slide', modal_header_title: true, modal_footer: false, modal_width: 'centered', modal_zindex_top: true} %}
			{% block modal_head %}
				{{ 'Termos & Condições' | translate }}
			{% endblock %}
			{% block modal_body %}
				<div class="terms-conditions-content">
					<p><strong>{{ 'Última atualização' | translate }}:</strong> {{ "now" | date('d/m/Y') }}</p>

					<p>Estes Termos &amp; Condições regulam o uso do site e a compra de produtos da EcoHost. Ao navegar ou realizar uma compra nesta loja, você declara ter lido, compreendido e aceito integralmente as condições abaixo.</p>

					<h4>1. Objeto</h4>
					<p>A EcoHost comercializa, através deste site, sistemas automatizados de economia de energia voltados a imóveis de locação por temporada (tipo Airbnb) e produtos relacionados, conforme descrição, imagens e preços apresentados em cada página de produto.</p>

					<h4>2. Cadastro e uso do site</h4>
					<p>Para concluir uma compra, o cliente deve fornecer dados verdadeiros, completos e atualizados. A EcoHost não se responsabiliza por informações incorretas fornecidas pelo próprio cliente no momento do cadastro ou checkout.</p>

					<h4>3. Produtos, preços e disponibilidade</h4>
					<p>Os preços exibidos no site são válidos apenas para compras realizadas on-line e podem ser alterados sem aviso prévio, respeitando-se o preço vigente no momento da confirmação do pedido. A disponibilidade de estoque é verificada no momento da compra; em caso de indisponibilidade após a confirmação, a EcoHost entrará em contato para oferecer alternativas, incluindo o cancelamento e reembolso integral do valor pago.</p>

					<h4>4. Pagamento</h4>
					<p>Os pagamentos são processados por meio dos métodos disponibilizados no checkout (cartão de crédito, Pix, boleto, entre outros exibidos). O pedido somente é confirmado após a aprovação do pagamento pela instituição financeira ou meio de pagamento responsável.</p>

					<h4>5. Entrega e frete</h4>
					<p>O prazo e o custo de entrega são calculados no checkout, com base no endereço informado e na modalidade de frete escolhida. Prazos informados são estimados e podem sofrer variações motivadas pela transportadora ou por casos fortuitos/força maior.</p>

					<h4>6. Direito de arrependimento, trocas e devoluções</h4>
					<p>Em conformidade com o Código de Defesa do Consumidor (Lei nº 8.078/90, art. 49), o cliente que realizar a compra fora do estabelecimento comercial (como é o caso de compras pela internet) tem o direito de desistir da compra em até 7 (sete) dias corridos a contar do recebimento do produto, sem necessidade de justificativa, com direito a reembolso integral dos valores pagos, incluindo o frete. Para exercer esse direito, o produto deve ser devolvido em sua embalagem original, sem indícios de uso, acompanhado da nota fiscal. Em caso de defeito de fabricação, aplicam-se as regras de garantia descritas abaixo.</p>

					<h4>7. Garantia</h4>
					<p>Os produtos EcoHost possuem garantia contra defeitos de fabricação, conforme especificado na página de cada produto e/ou nas Perguntas Frequentes do site. A garantia não cobre danos decorrentes de mau uso, instalação realizada em desacordo com as orientações técnicas, ou violação do produto por terceiros não autorizados.</p>

					<h4>8. Responsabilidades</h4>
					<p>A EcoHost se compromete a fornecer informações claras e precisas sobre seus produtos. O funcionamento do sistema depende da correta instalação e configuração do equipamento no imóvel do cliente. A EcoHost não se responsabiliza por danos indiretos decorrentes de uso inadequado, instalação por terceiros não orientados pela empresa, ou de fatores alheios ao equipamento (como instabilidades na rede elétrica do imóvel).</p>

					<h4>9. Propriedade intelectual</h4>
					<p>Todo o conteúdo deste site - textos, imagens, marca, layout e identidade visual - é de propriedade da EcoHost ou de seus licenciadores, sendo proibida a reprodução total ou parcial sem autorização prévia e expressa.</p>

					<h4>10. Privacidade e proteção de dados</h4>
					<p>Os dados pessoais fornecidos pelo cliente são tratados em conformidade com a Lei Geral de Proteção de Dados (Lei nº 13.709/18 - LGPD) e utilizados exclusivamente para processar o pedido, realizar a entrega e prestar suporte ao cliente, não sendo compartilhados com terceiros para fins alheios à compra.</p>

					<h4>11. Alterações destes termos</h4>
					<p>A EcoHost pode atualizar estes Termos &amp; Condições a qualquer momento, sendo a versão vigente sempre a publicada nesta página, identificada pela data de "última atualização" acima.</p>

					<h4>12. Foro e legislação aplicável</h4>
					<p>Estes Termos &amp; Condições são regidos pela legislação brasileira. Fica eleito o foro do domicílio do consumidor para dirimir eventuais controvérsias decorrentes deste instrumento, conforme previsto no Código de Defesa do Consumidor.</p>

					<p>{{ 'Em caso de dúvidas sobre estes termos, entre em contato através dos nossos canais de atendimento.' | translate }}</p>
				</div>
			{% endblock %}
		{% endembed %}

		{{ component('claim-info', {
				container_classes: "d-md-inline-block mt-md-0 mt-3 font-smallest",
				divider_classes: "mx-1 d-none d-md-inline-block",
				text_classes: {text_consumer_defense: 'd-inline-block mb-2'},
				link_classes: {
					link_consumer_defense: "btn-link font-smallest",
					link_order_cancellation: "btn-link font-smallest d-md-inline-block d-block mb-2 w-100 w-md-auto",
				},
			}) 
		}}
	</div>
</footer>

{{ component('nubesdk-slot', { type: "after_footer" }) }}