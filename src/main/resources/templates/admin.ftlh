<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Панель администратора</h1><hr>
    <table class="table table-hover table-white">
        <tr>
            <th scope="col">Email</th>
            <th scope="col">Номер телефона</th>
            <th scope="col">Активность</th>
            <th scope="col">Роли</th>
            <th scope="col">Бан</th>
            <th scope="col">Редактирование</th>
            <th scope="col">Подробная информация</th>
        </tr>
        <#list users as user>
            <tr>
                <th class="align-middle">${user.email}</th>
                <th class="align-middle">${user.phoneNumber}</th>
                <th class="align-middle"><#if user.active><p style="color:green" class="align-middle">Активный</p> <#else><p style="color:red" class="align-middle">Забанен</p></#if></th>
                <th class="align-middle"><#list user.roles as role>${role}</#list></th>
                <th class="align-middle">
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="btn btn-light" value="Бан">
                    </form>
                </th>
                <th class="align-middle">
                    <form action="/admin/user/edit/${user.id}">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="btn btn-light" value="Редактировние">
                    </form>
                <th class="align-middle">
                    <form action="/user/${user.id}">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="btn btn-light" value="Подробная информация">
                    </form>
            </tr>
        <#else>
            <h3>Пользователей нет</h3>
        </#list>
    </table>
</@t.template>
