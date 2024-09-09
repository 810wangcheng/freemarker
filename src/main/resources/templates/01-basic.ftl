<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>freeMarker基础</title>
    </head>
    <body>
        <b>普通文本String展示：</b><br>
        hello ${name!}
        <hr>
        <b>对象Student中的数据展示：</b><br>
        姓名：${(stu.name)!}
        年龄：${stu.age}
    </body>
</html>