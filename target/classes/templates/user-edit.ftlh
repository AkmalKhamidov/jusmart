<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Редактирование пользователя ${user.name}</h1><hr>
    <form action="/admin/user/edit" method="post">
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" value="${user.email}" class="form-control" style="size: 30px" required id="email" name="email">
        </div>
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-dark">Сохранить</button>
    </form>

</@t.template>