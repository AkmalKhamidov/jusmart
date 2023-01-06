<#import "blocks/template.ftlh" as t>
<@t.template user>
        <h1 style="text-align: center">Авторизация</h1>
        <hr>

            <form action="/login" class="login_form" method="post">
                <div class="form-group email" style="align-content: center">
                    <label for="email">Электронная почта</label>
                    <input type="email" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="email" name="username">
                    <div id="email" class="invalid-feedback">
                        Неверныя электронная почта
                    </div>
                </div>
                <div class="form-group password">
                    <label for="password">Пароль</label>
                    <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="password" name="password">
                    <div id="password" class="invalid-feedback">
                        Неверный пароль
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" style="width: 100%" class="btn btn-dark mb-4">Войти</button>
            </form>
        <hr>
        <h2>Нет аккаунта JUSMART? <a href="/registration">Зарегистрируйся!</a></h2>
</@t.template>