<#import "/assets/images/taca.ftl" as taça >
<#macro kw>
  <div class="w-full flex">
    <#nested>
    <div style="
    background: linear-gradient(103.55deg, rgba(239, 154, 154, 0.3) 0%, rgba(128, 222, 234, 0.3) 49.48%, rgba(255, 253, 231, 0.3) 100%, rgba(255, 245, 157, 0.3) 100%);
    height: 100vh;
    flex-grow: 1;
    "> 
    <div style="margin-left: 20rem; margin-top: 10rem; "> <@taça.kw/>
    <h2 style="
    margin-top: 40px;
    font-weight: bold;
    font-size: 24px;"
>EMPRESA EXCELENCIA </h2>
    
    </div>
   
    </div>
  </div>
</#macro>
