<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Поиск товаров</h1>
    <form method="get" action="/">
        <div class="row g-3 align-items-center">
            <div class="form-group col-md-2">
                <label for="searchCity">Город</label>
                <select id="searchCity" class="form-control">
                    <option value="">Город не выбран</option>
                    <option value="Ташкент">Ташкент</option>
                    <option value="Самарканд">Самарканд</option>
                    <option value="Бухара">Бухара</option>
                    <option value="Наманган">Наманган</option>
                    <option value="Сырдарья">Сырдарья</option>
                </select>
            </div>
            <div class="form-group col-md-10">
                <label for="searchWord">Поиск по объявлениям</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                       id="searchWord">
            </div>
            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <hr>

    <div class="card-group">
        <#list products as product>
            <div class="row">
                <a href="/product/${product.ID}" class="product-link">
                    <div class="col px-2 pb-2">
                        <div class="card text-white bg-black bg-opacity-75 my-3 product">
                            <img src="/images/${product.previewImageId}"
                                 class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">${product.title}</h5>
                                <p class="card-text">${product.price} $</p>
                            </div>
                            <div class="card-footer">
                                ${product.city}
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>