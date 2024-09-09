<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>freemarker study</title>
</head>
<body>
    <p>常用内建函数示例：</p>
    <#assign htmlCode="hello <lable style=\"color:red;\">world</label>"/>
    <#assign user="administrator" />
<#--    输出html代码-->
    <p>html=${htmlCode?html}</p>
<#--    转大写-->
    <p>upper_case=${user?upper_case}</p>
<#--    首字母大写-->
    <p>cap_first=${user?cap_first}</p>
<#--    长度-->
    <p>length=${user?length}</p>

    <p>list 标签中内置函数示例</p>
    <#assign books=["Java","C#","C++"] />
<#--    个数-->
    <p>size=${books?size}</p>
    <#list books>
        <#items as book>
<#--            下标-->
            <p>index=${book?index}</p>
<#--            第几个-->
            <p>counter=${book?counter}</p>
<#--            奇偶性-->
            <p>item_parity=${book?item_parity}</p>
        </#items>
    </#list>

    <p>一些内建函数需要参数来指定行为</p>
    <#assign colors=["red","blue","green"] />
    <#assign flag=false />
<#--    字符判断-->
    <p>string=${flag?string("Y","N")}</p>
    <#list books>
        <#items as book>
<#--            遍历-->
            <p>item_parity=${book?item_cycle("lightRow","darkRow")}</p>
        </#items>
    </#list>
<#--    列表拼接字符-->
    <p>join=${colors?join(",")}</p>
<#--    判断开始字母-->
    <#if user?starts_with("a")>
        <p>starts_with=${user} 以a开头</p>
        <#else>
        <p>starts_with=${user} 不以a开头</p>
    </#if>
</body>
</html>