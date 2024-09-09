<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>freemarker 自定义指令</title>
</head>
<body>
<#--macro 声明宏指令 greet为宏变量 引用时使用@greet person为传入的变量-->
    <#macro greet person>
        <font>Hello ${person}</font>
    </#macro>

    <@greet person="Fred"></@greet>
    <@greet person="Batman"></@greet>
<#--嵌套内容-->
    <#macro border>
        <table border="4" cellspacing="0" cellpadding="4">
            <tr>
<#--                nested接收传入的数据-->
                <td><#nested></td>
            </tr>
        </table>
    </#macro>

    <@border>The bordered text</@border>

    <#macro do_thrice>
        <#nested>
        <#nested>
        <#nested>
    </#macro>
    <@do_thrice>
        Anything.
    </@do_thrice>

    <@border>
        <ul>
            <@do_thrice>
                <li><@greet person="Joe"></@greet></li>
            </@do_thrice>
        </ul>
    </@border>

<#--    一个宏可以使用多个循环变量-->
    <#macro repeat count>
        <#list 1..count as x>
            <#nested x, x/2,x==count>
        </#list>
    </#macro>

    <@repeat count=4 ; c,halfc,last>
        ${c}. ${halfc}<#if last> Last!</#if>
    </@repeat>
</body>
</html>