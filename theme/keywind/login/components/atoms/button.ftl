<#macro kw color="" component="button" size="medium" width="" rest...>
  <#switch color>
    <#case "primary">
      <#assign colorClass="bg-[#AD8B19] text-white focus:ring-primary-600 hover:bg-[#AD8B19] ">
      <#break>
    <#case "secondary">
      <#assign colorClass="bg-[#AD8B19] text-secondary-600 focus:ring-secondary-600 hover:bg-[#AD8B19] hover:text-secondary-900">
      <#break>
    <#default>
      <#assign colorClass="bg-[#AD8B19]  text-white focus:ring-primary-600 hover:bg-primary-700">
  </#switch>

  <#switch size>
    <#case "small">
      <#assign sizeClass="px-2 py-2 text-sm">
      <#break>
    <#case "small">
      <#assign sizeClass="px-2 py-1 text-xs">
      <#break>
    <#default>
      <#assign sizeClass="px-4 py-2 text-sm">
  </#switch>

  <#assign widthClass = "" >
  <#if width?has_content>
    <#assign widthClass = "w-${width}">  
  </#if>

  <${component}
    class="${colorClass} ${sizeClass} flex justify-center relative rounded-full ${widthClass} focus:outline-none focus:ring-2 focus:ring-offset-2"

    <#list rest as attrName, attrValue>
      ${attrName}="${attrValue}"
    </#list>
  >
    <#nested>
  </${component}>
</#macro>
