{# Custom FAQ accordion block. Content is hardcoded (mirrors the "Perguntas Frequentes" page). #}

{% set faq_items = [
	{
		question: 'O EcoHost interfere na experiência do hóspede?',
		answer: 'Não. O sistema só solicita confirmação de presença após a abertura da porta de entrada. Se houver alguém no imóvel, basta pressionar a autenticadora e tudo funciona normalmente. O conforto e o uso do espaço não são impactados.'
	},
	{
		question: 'O que exatamente o EcoHost desliga?',
		answer: 'O sistema interrompe os circuitos definidos na instalação, normalmente ar-condicionado, tomadas e iluminação. A configuração é personalizada de acordo com cada imóvel.'
	},
	{
		question: 'O sistema pode desligar alguém dentro do imóvel por engano?',
		answer: 'Não. Após a abertura da porta, o módulo aguarda 60 segundos antes de suspender a energia. Se houver alguém no imóvel, a autenticação de presença mantém o funcionamento ativo.'
	},
	{
		question: 'O EcoHost pode danificar ar-condicionado ou equipamentos?',
		answer: 'Não. O sistema apenas interrompe o fornecimento de energia de forma controlada, como se o disjuntor fosse desligado. Não interfere na parte eletrônica dos aparelhos.'
	},
	{
		question: 'O sistema realmente reduz a conta de luz?',
		answer: 'Sim. Em casos reais, a redução no desperdício de energia pode chegar a até 70%, dependendo do padrão de uso do imóvel.'
	},
	{
		question: 'O EcoHost ajuda na prevenção de incêndios?',
		answer: 'Sim. Ao evitar que equipamentos como ar-condicionado, cafeteiras e outros aparelhos permaneçam ligados sem necessidade, o sistema reduz riscos de sobrecarga elétrica e incidentes causados por esquecimento.'
	},
	{
		question: 'É necessário fazer obra ou quebrar paredes?',
		answer: 'Não. A instalação é feita sem fio, com fixação técnica e integração direta ao quadro elétrico do imóvel.'
	},
	{
		question: 'Quanto tempo leva a instalação?',
		answer: 'Em média até 3 horas, dependendo da configuração do imóvel.'
	},
	{
		question: 'Funciona em 110V e 220V?',
		answer: 'Sim. O EcoHost é compatível com ambos os padrões elétricos.'
	},
	{
		question: 'Qual é a garantia do EcoHost?',
		answer: 'O sistema possui garantia de 1 ano contra defeitos de fabricação.'
	},
	{
		question: 'Como funciona o suporte técnico?',
		answer: 'O suporte é realizado via WhatsApp, de segunda a sexta-feira, em horário comercial.'
	},
	{
		question: 'O sistema exige manutenção?',
		answer: 'A única manutenção necessária é a substituição das pilhas das autenticadoras, em média uma vez por ano.'
	},
	{
		question: 'Quais são as formas de pagamento?',
		answer: 'Aceitamos cartões de crédito (Visa, MasterCard, American Express, Diners Club, Aura, Elo, Hipercard e Discover), Boleto e Pix.'
	},
	{
		question: 'Qual o custo do envio?',
		answer: 'O custo do envio será calculado com base no total da compra e endereço da entrega, no checkout, no momento prévio à confirmação da compra.'
	},
	{
		question: 'Onde posso receber meu pedido?',
		answer: 'Fazemos envios para todo o país.'
	},
	{
		question: 'Quanto tempo meu pedido vai demorar para chegar?',
		answer: 'O tempo de entrega dependerá do tipo de frete selecionado. Normalmente, a demora é de entre 3 e 7 dias úteis após acreditação do pagamento.'
	}
] %}

<section class="section-faq" data-store="home-faq">
	<div class="faq-container">
		<div class="faq-heading">
			<h2>{{ 'Perguntas frequentes' | translate }}</h2>
			<p>{{ 'Tudo o que você precisa saber antes de comprar.' | translate }}</p>
		</div>
		<div class="faq-list">
			{% for item in faq_items %}
				<details class="faq-item">
					<summary class="faq-question">
						{{ item.question }}
						<svg class="faq-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5v14"/></svg>
					</summary>
					<div class="faq-answer">
						<p>{{ item.answer }}</p>
					</div>
				</details>
			{% endfor %}
		</div>
	</div>
</section>
