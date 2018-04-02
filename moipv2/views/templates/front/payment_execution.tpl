{*
*
* 2017-2018 Moip Wirecard Brasil
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
*
*  @author MOIP DEVS - <prestashop@moip.com.br>
*  @copyright  2017-2018 Moip Wirecard Brasil
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*
*}

{capture name=path}
	<a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'htmlall':'UTF-8'}" title="{l s='Go back to the Checkout' mod='moipv2'}">{l s='Checkout' mod='moipv2'}</a><span class="navigation-pipe">{$navigationPipe}</span>{l s='Moip Pagamentos S/A' mod='moipv2'}
{/capture}


<h2>{l s='Pagamento' mod='moipv2'}</h2>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if isset($nbProducts) && $nbProducts <= 0}
	<p class="warning">{l s='Seu carrinho de compras está vazio.' mod='moipv2'}</p>
{else}

<form action="{$link->getModuleLink('moipv2', 'validation', [], true)|escape:'htmlall':'UTF-8'}" method="post" id="form-moip-v2">
	<input type="hidden" name="method_moip_pay" value="{$method_moip_pay|escape:'htmlall':'UTF-8'}">

		{if $method_moip_pay == 'CREDIT_CARD'}
			
			<input type="hidden" name="moip_order" value="{$moip_order|escape:'htmlall':'UTF-8'}">
			<textarea name="moip_token" style="display:none">{$moip_token|escape:'htmlall':'UTF-8'}</textarea>
			
			<p>Você selecionou o pagamento por cartão de crédito.</p>
				
			<p class="cart_navigation" id="cart_navigation">
				<a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'htmlall':'UTF-8'}" class="button_large">{l s='Voltar' mod='moipv2'}</a>
				<input type="submit" value="{l s='Confirmar Pagamento' mod='moipv2'}" class="exclusive_large"/>
			</p>
			
			
				
			
		
		{elseif $method_moip_pay == 'BOLETO'}
			<input type="hidden" name="codigo_moip" value="{$codigo_moip|escape:'htmlall':'UTF-8'}">
			<input type="hidden" name="status_moip" value="{$status_moip|escape:'htmlall':'UTF-8'}">
			<input type="hidden" name="href_boleto" value="{$href_boleto|escape:'htmlall':'UTF-8'}">
			<input type="hidden" name="code_line_moip" value="{$code_line_moip|escape:'htmlall':'UTF-8'}">
			{if $redir_automatic}
				
				<p class="warning">Por favor aguarde em quanto processamos o seu boleto</p>
				<p class="cart_navigation" id="cart_navigation">
					<input type="submit" value="{l s='Imprimir boleto' mod='moipv2'}" id="force_trigger" class="exclusive_large"/>
				</p>
				{literal}
				        <script type="text/javascript">
				          $(document).ready(function(){
				                 $( "#force_trigger" ).trigger('click');
				            });
				            
				        </script>
				{/literal}

			{else}
			<p class="warning">Você selecionou pagar via Boleto. Deseja confirmar o seu pedido?</p>
			<p class="cart_navigation" id="cart_navigation">
				
				<input type="submit" value="{l s='Concluir Pedido' mod='moipv2'}" class="exclusive_large"/>
				<a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'htmlall':'UTF-8'}" class="button_large">{l s='Voltar' mod='moipv2'}</a>
				
				
				
			</p>
			{/if}
		{elseif $method_moip_pay == 'ONLINE_BANK_DEBIT'}
			<input type="hidden" name="codigo_moip" value="{$codigo_moip|escape:'htmlall':'UTF-8'}">
			<input type="hidden" name="status_moip" value="{$status_moip|escape:'htmlall':'UTF-8'}">
			<input type="hidden" name="href_bank" value="{$href_bank|escape:'htmlall':'UTF-8'}">
			
			{if $redir_automatic}
				<p class="warning">Por favor aguarde em quanto redirecionamos ao banco</p>
				<p class="cart_navigation" id="cart_navigation">
					<input type="submit" value="{l s='Confirmar Pedido' mod='moipv2'}"  id="force_trigger" class="exclusive_large"/>
				</p>
				{literal}
				         <script type="text/javascript">
				          $(document).ready(function(){
				                 $( "#force_trigger" ).trigger('click');
				            });
				            
				        </script>
				{/literal}
			{else}
			Você selecionou o pagamento por transferência bancária.
			<p class="cart_navigation" id="cart_navigation">
				
				<input type="submit" value="{l s='Confirmar Pedido' mod='moipv2'}" class="exclusive_large"/>
				
				<a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'htmlall':'UTF-8'}" class="button_large">{l s='Voltar' mod='moipv2'}</a>
				
				
				
			</p>
			{/if}
		{elseif $method_moip_pay == 'ERRO'}
		
	
		
			<p class="warning">Ocorreu um erro no processamento do seu pedido: {$erro_message|escape:'htmlall':'UTF-8'}</p>
			<p class="cart_navigation" id="cart_navigation">
		
				<a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'htmlall':'UTF-8'}" class="button_large">{l s='Voltar' mod='moipv2'}</a>
			</p>
			
		{/if}
		
		

	
</form>
{/if}
