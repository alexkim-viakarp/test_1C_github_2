﻿#language: ru

@tree

Функционал: Тест заполение табличных частей

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Тест заполение табличных частей
// в курсе его удаляют
    И я закрываю все окна клиентского приложения
    Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseOrder"
    Когда открылось окно 'Заказы поставщикам'
    И я нажимаю на кнопку с именем 'FormCreate'
    Тогда открылось окно 'Заказ поставщику (создание)'
    И я нажимаю кнопку выбора у поля с именем "Partner"
    Тогда открылось окно 'Партнеры'
    И в таблице "List" я перехожу к строке:
        | 'Код' | 'Наименование'               |
        | '3'   | 'Поставщик 1 (1 соглашение)' |
    И в таблице "List" я активизирую поле с именем "Description"
    И я нажимаю на кнопку с именем 'FormChoose'
    Тогда открылось окно 'Заказ поставщику (создание) *'
    // лобавление товара    
    // переход к номенклатуре с помощью сочетания клавиш
    Когда открылось окно 'Заказ поставщику (создание) *'
    И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
    И в таблице "ItemList" я активизирую поле с именем "ItemListItem"
    И я нажимаю сочетание клавиш "Enter"
    //И в таблице "ItemList" в поле с именем 'ItemListItem' я ввожу текст 'товар без характеристик'
    И в таблице "ItemList" из выпадающего списка с именем "ItemListItem" я выбираю по строке 'товар без характеристик'
    //И я нажимаю сочетание клавиш "Enter"
    //И в таблице "ItemList" я завершаю редактирование строки
    //И в таблице "ItemList" я добавляю строку
    //И в таблице "ItemList" я активизирую поле с именем "ItemListPartnerItem"
    // переход к номенклатиуре с помощью сочетания клавиш
    И я нажимаю сочетание клавиш "F9"
    И в таблице "ItemList" я завершаю редактирование строки
        
    И в таблице "ItemList" я перехожу к следующей ячейке
    И в таблице "ItemList" я устанавливаю флаг "Отмена"
    И Проверяю шаги на Исключение:
            |'И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "Номенклатура"'|
    Тогда таблица "ItemList" содержит строки:
        | 'Сумма без налогов' | 'Сумма скидки' | 'N' | 'Причина отмены' | 'Номенклатура партнера' | 'Номенклатура'            | 'Не рассчитывать строки' | 'Характеристика'          | 'Сумма налогов' | 'Количество' | 'Ед. изм.' | 'Заказ покупателя' | 'Общая сумма' | 'Дата выполнения' | 'Основание закупки' | 'Склад'                         | 'Вид цены'          | 'Статья расходов' | 'Центр прибыли/убытков' | 'Цена'   | 'Заявка на обеспечение товара' | 'НДС' | 'Отмена' | 'Комментарий' |
        | '125,00'            | ''             | '1' | ''               | ''                      | 'Товар без характеристик' | 'Нет'                    | 'Товар без характеристик' | '25,00'         | '1,000'      | 'шт'       | ''                 | '150,00'      | ''                | ''                  | 'Склад 1 (с контролем остатка)' | 'Цена поставщика 1' | ''                | ''                      | '150,00' | ''                             | '20%' | 'Нет'    | ''            |
        | '250,00'            | ''             | '2' | ''               | ''                      | 'Товар без характеристик' | 'Нет'                    | 'Товар без характеристик' | '50,00'         | '2,000'      | 'шт'       | ''                 | '300,00'      | ''                | ''                  | 'Склад 1 (с контролем остатка)' | 'Цена поставщика 1' | ''                | ''                      | '150,00' | ''                             | '20%' | 'Нет'    | ''            |
    
    Тогда в таблице "ItemList" количество строк "меньше или равно" 2
    // сортировка строк стандартным способом
    И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListSortListAsc'
    // сортировка
    И в таблице "List" текущего окна я устанавливаю сортировку по колонке "Partner" по возрастанию (расширение)
    И в таблице "List" текущего окна я устанавливаю сортировку по колонке "Partner" по убыванию (расширение)

    И таблица "List" содержит строки из макета "Макет" по шаблону
    
    




