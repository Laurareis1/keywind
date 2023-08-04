<#import "document.ftl" as document>
<#import "components/atoms/alert.ftl" as alert>
<#import "components/atoms/body.ftl" as body>
<#import "components/atoms/button.ftl" as button>
<#import "components/atoms/card.ftl" as card>
<#import "components/atoms/container.ftl" as container>
<#import "components/atoms/heading.ftl" as heading>
<#import "components/atoms/logo.ftl" as logo>
<#import "components/atoms/nav.ftl" as nav>
<#import "components/molecules/locale-provider.ftl" as localeProvider>
<#import "components/molecules/username.ftl" as username>

<#macro
  registrationLayout
  displayInfo=false
  displayMessage=true
  displayRequiredFields=false
  script=""
  showAnotherWayIfPresent=true
>
  <!-- Section 1 -->
  <div  style="width: 100%; height: 100vh; padding: 1px; background-color: #ffffff; margin: 0 auto;">
    <#assign cardHeader>
      <@logo.kw> 
     
      </@logo.kw>
      <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
         <@heading.kw> 
         <#nested "header"> 
        </@heading.kw>
      <#else>
        <#nested "show-username">
        <@username.kw
          linkHref=url.loginRestartFlowUrl
          linkTitle=msg("restartLoginTooltip")
          name=auth.attemptedUsername
        />
      </#if>
    </#assign>
    <#assign cardContent>
      <#if displayMessage && message?has_content && (message.type != "warning" || !isAppInitiatedAction??)>
        <@alert.kw color=message.type>
          ${kcSanitize(message.summary)?no_esc}
        </@alert.kw>
      </#if>
      <#nested "form">
      <#if displayRequiredFields>
        <p class="text-secondary-600 text-sm">
          * ${msg("requiredFields")}
        </p>
      </#if>
      <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
        <form action="${url.loginAction}" method="post">
          <input name="Login" type="hidden" value="on" />
          <@button.kw color="primary" size="small" type="submit" width="10px">
             Login
          </@button.kw>
        </form>
      </#if>
      <#nested "socialProviders">
    </#assign>
    <#assign cardFooter>
      <#if displayInfo>
        <#nested "info">
      </#if>
    </#assign>

    <html>
      <head>
        <@document.kw script=script />
      </head>
      <@body.kw>
        <@container.kw>
          <@card.kw content=cardContent footer=cardFooter header=cardHeader />
        </@container.kw>
      </@body.kw>
    </html>
  </div>
  
  <!-- Section 2 -->
  <div style="width: 800px; margin: 0 auto; padding: 20px;">
    <!-- Adicionar a imagem abaixo do título "Adicione a imagem aqui" -->
  </div>
  <div style="clear: both;">
  </div> <!-- Clear the floats after the two sections -->
</#macro>
