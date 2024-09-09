<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>freemarker study</title>
    </head>
    <body>
        <p>${"C:\\demo\\red\\index.html"}</p>
        <p>${r"C:\demo\red\index.html"}</p>
        <#-- <#list lists as item>${item}</#list> 遍历列表       -->
        <#-- 生成 0 到 9 的数字序列 -->
        <p><#list 0..9 as item>${item}<#sep>,</#list></p>
        <#-- 生成 0 到小于 10 的数字序列 -->
        <p><#list 0..<10 as item>${item}<#sep>,</#list></p>
        <p><#list 0..!10 as item>${item}<#sep>,</#list></p>
        <#-- 生成 0 到无穷大的数字序列 -->
        <p><#list 0.. as item>${item}<#sep>,</#list></p>

        <#-- 字符串切割 -->
        <#assign host="https://www.hxstrive.com">
        <p>${host[0..6]}</p>
        <p>${host[0..<6]}</p>
        <p>${host[0..*100]}</p>
        <p>${host[7..]}</p>
    </body>
</html>