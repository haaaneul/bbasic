<#--
(C) Copyright 2015 Somonar B.V.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.

-->
<#include 'component://widget/templates/htmlMenuMacroLibrary.ftl'>


<#macro renderImage src id style width height border>
<img src="${src}"<#if id?has_content> id="${id}"</#if><#if style?has_content> class="${style}"</#if><#if width?has_content> width="${width}"</#if><#if height?has_content> height="${height}"</#if><#if border?has_content> border="${border}"</#if> />
</#macro>

<#macro renderLink linkUrl parameterList targetWindow uniqueItemName actionUrl linkType="" id="" style="" name="" height="" width="" text="" imgStr="">
  <#if linkType?has_content && "hidden-form" == linkType>
<form method="post" action="${actionUrl}"<#if targetWindow?has_content> target="${targetWindow}"</#if> onsubmit="javascript:submitFormDisableSubmits(this)" name="${uniqueItemName}"><#rt/>
    <#list parameterList as parameter>
<input name="${parameter.name}" value="${parameter.value}" type="hidden"/><#rt/>
    </#list>
</form><#rt/>
  </#if>
<#if (linkType?has_content && "hidden-form" == linkType) || linkUrl?has_content>
<a<#if id?has_content> id="${id}"</#if><#if style?has_content> class="${style}"</#if><#if name?has_content> name="${name}"</#if><#if targetWindow?has_content> target="${targetWindow}"</#if> href="<#if "hidden-form"==linkType>javascript:document.${uniqueItemName}.submit()<#else>${linkUrl}</#if>"><#rt/>
</#if>
<#if imgStr?has_content>${imgStr}</#if><#if text?has_content>${text}</#if><#rt/>
<#if (linkType?has_content && "hidden-form" == linkType) || linkUrl?has_content></a><#rt/></#if>
</#macro>

<#macro renderMenuBegin boundaryComment="" id="" style="" title="">
    <#assign menuStyle = style />
    <#if boundaryComment?has_content>
    <!-- ${boundaryComment} -->
    </#if>
    <#-- <div<#if id?has_content> id="${id}"<#elseif style?has_content> class="${style}"</#if>> -->
    <#if style == "button-bar tab-bar">
    <nav class="navbar navbar-default button-bar tab-bar" role="navigation">
      <ul class="nav navbar-nav">
            <#if title?has_content>
                <li class="menuTitle"><a href="#">${title}</a></li>
            </#if>
    <#elseif style == "button-bar button-style-2">
            <#if title?has_content>
                <li class="menuTitle"><a href="#">${title}</a></li>
            </#if>
        <ul class="nav navbar-pills" role="tablist">
    <#else>
        <nav class="navbar navbar-default" role="navigation">
        <ul class="nav navbar-nav">
  </#if>
</#macro>

<#macro renderMenuEnd boundaryComment="" style="">
    <#if menuStyle == "button-bar tab-bar">
        </ul>
        </nav>
    <#elseif style == "button-bar button-style-2">
        <#-- <nav class="navbar navbar-default button-bar button-style-2" role="navigation"> -->
        </ul>
        </nav>
    <#else>
      </ul>
    </nav>
    </#if>
<#if boundaryComment?has_content>
<!-- ${boundaryComment} -->
</#if>
</#macro>

<#macro renderMenuItemBegin style toolTip linkStr containsNestedMenus>
    <#if menuStyle = "button-bar button-style-2">
        <#if style == "buttontext create">
            <div class="btn btn-primary btn-xs" <#if toolTip?has_content> title="${toolTip}"</#if>>
                <#if linkStr?has_content>${linkStr}</#if>
                <#if containsNestedMenus><ul></#if>
                <#rt/>
        <#else>
            <div class="btn btn-default btn-xs" <#if toolTip?has_content> title="${toolTip}"</#if>>
                <#if linkStr?has_content>${linkStr}</#if>
                <#if containsNestedMenus><ul></#if><#rt/>
        </#if>
    <#else>
        <li<#if style?has_content> class="${style}"</#if><#if toolTip?has_content> title="${toolTip}"</#if>><#if linkStr?has_content>${linkStr}</#if><#if containsNestedMenus><ul></#if><#rt/>
    </#if>
</#macro>

<#macro renderMenuItemEnd containsNestedMenus>
    <#if menuStyle = "button-bar button-style-2">
        </div>
    <#else>
        <#if containsNestedMenus></ul></#if>
        </li>
    </#if>
</#macro>
