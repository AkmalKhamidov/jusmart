<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Мои товары</h1>
    <hr>
    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-bs-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Добавить новый товар
    </a>
    <div class="collapse" id="collapseExample"  style="">
        <form action="/product/create" method="post" enctype="multipart/form-data">
            <div class="form-group mx-4 mb-4">
                <label for="productName">Название товара</label>
                <input type="text" required class="form-control"
                       id="productName" name="title">
            </div>
            <div class="form-group mx-4 mb-4">
                <label for="price">Цена товара</label>
                <div class="input-group mb-3">
                    <input type="number" required class="form-control" id="price" name="price">
                    <div class="input-group-append">
                        <span class="input-group-text">$</span>
                    </div>
                </div>
            </div>
            <div class="form-group mx-4 mb-4">
                <label for="searchCity">Город</label>
                <select id="searchCity" required name="city" class="form-control">
                    <option value="">Город не выбран</option>

                    <option value="Ташкент">Ташкент</option>
                    <option value="Самарканд">Самарканд</option>
                    <option value="Бухара">Бухара</option>
                    <option value="Наманган">Наманган</option>
                    <option value="Сырдарья">Сырдарья</option>

                </select>
            </div>
            <div class="form-group mx-4 mb-4">
                <label for="description">Описание товара</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div>
            <div class="form-group mx-4 mb-4">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Первая фотография к товару</label>
                </div>
            </div>
            <div class="form-group mx-4 mb-4">
                <div class="custom-file">
                    <input type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Вторая фотография к товару</label>
                </div>
            </div>
            <div class="form-group mx-4 mb-4">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Третья фотография к товару</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
    </div>

    <div class="card-group">
        <#list products as product>
            <div class="row">
                <a href="/product/${product.ID}" class="product-link">
                    <div class="col px-2 pb-2">
                        <div class="card text-white bg-black bg-opacity-75 my-3 product">
                            <div class="card-top">
                                <form id="deleteForm" action="${'/product/delete/' + product.ID}" method="post">
                                    <button type="submit" class="btn btn-danger m-3">
                                        Удалить
                                    </button>
                                </form>
                            </div>
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