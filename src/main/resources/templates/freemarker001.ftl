<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>${inputMap.title}</title>
    </head>
    <body>
        <h1>${inputMap.contentTitle}</h1>
        <p>书籍列表</p>
        <table>
            <tr>
                <th>名称</th>
                <th>价格</th>
            </tr>
            <#-- 打印书籍列表 -->
            <#list inputMap.books as book>
                <tr>
                    <td>${book.name}</td>
                    <td>${book.price}</td>
                </tr>
            </#list>
        </table>
    </body>
</html>