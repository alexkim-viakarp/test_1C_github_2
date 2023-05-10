#language: ru

@tree
@ДвиженияДокументов


Функционал: проверка движения документа Поступление товаров

Как Тестировщик я хочу
проверить движения документа Поступление товаров
чтобы убедиться что документ делает движения по нужным регистрам

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0501 подготовительный сценарий (движения документа Поступение товаров)

    Когда экспорт основных данных

    Когда загрузка документа Поступление товаров и услуг
    //Дано Я открываю навигационную ссылку "e1cib/data/Document.PurchaseInvoice?ref=af28a8a159af068311ede98c24ac2fa2"
    Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
    Тогда в таблице "List" я выделяю все строки
    //Когда открылось окно 'Поступления товаров и услуг'
    //И в таблице "List" я активизирую поле с именем "Date"
    И в таблице "List" я нажимаю на кнопку с именем 'ListContextMenuPost'
    // 1-вариант проверка на сообщение что всё нормально
    Тогда не появилось окно предупреждения системы
    // 2-вариант
    И я выполняю код встроенного языка на сервере
    """bsl
        Сообщить("Hello world.");
    """
    И я выполняю код встроенного языка на сервере
        |'Документы.PurchaseInvoice.НайтиПоНомеру(1001).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
    // 3-вариант ...

Сценарий: _0502 проверка движений документа Поступление товаров по регистру R1001 Закупки
    Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
    И в таблице "List" я перехожу к строке
            | 'Номер' |
            | '1 001' |
    //
    И я нажимаю на кнопку с именем 'FormReportDocumentRegistrationsReportRegistrationsReport'
    Тогда открылось окно 'Движения документа'
    //И в табличном документе 'ResultTable' я перехожу к ячейке "R1C1"
    И из выпадающего списка с именем "FilterRegister" я выбираю точное значение 'R1001 Закупки'
    И я нажимаю на кнопку с именем 'GenerateReport'
    Тогда табличный документ "ResultTable" равен:
        | 'Поступление товаров и услуг 1 001 от 03.05.2023 15:18:04' | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
        | 'Движения документа по регистрам'                          | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
        | 'Регистр  "R1001 Закупки"'                                 | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
        | ''                                                         | 'Period'              | 'Resources'  | ''      | ''                  | ''             | 'Dimensions'             | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | 'Attributes'        |
        | ''                                                         | ''                    | 'Количество' | 'Сумма' | 'Сумма без налогов' | 'Сумма скидки' | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Инвойс'                                                   | 'Характеристика'          | 'Ключ строки'                          | 'Отложенный расчет' |
        | ''                                                         | '03.05.2023 15:18:04' | '1'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 03.05.2023 15:18:04' | 'Услуга'                  | 'ba3c5f00-2256-49a1-90dc-a44f854773de' | 'Да'                |
        | ''                                                         | '03.05.2023 15:18:04' | '1'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 03.05.2023 15:18:04' | 'Услуга'                  | 'ba3c5f00-2256-49a1-90dc-a44f854773de' | 'Нет'               |
        | ''                                                         | '03.05.2023 15:18:04' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 03.05.2023 15:18:04' | 'Услуга'                  | 'ba3c5f00-2256-49a1-90dc-a44f854773de' | 'Нет'               |
        | ''                                                         | '03.05.2023 15:18:04' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 03.05.2023 15:18:04' | 'Услуга'                  | 'ba3c5f00-2256-49a1-90dc-a44f854773de' | 'Нет'               |
        | ''                                                         | '03.05.2023 15:18:04' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 03.05.2023 15:18:04' | 'Услуга'                  | 'ba3c5f00-2256-49a1-90dc-a44f854773de' | 'Нет'               |
        | ''                                                         | '03.05.2023 15:18:04' | '2'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 03.05.2023 15:18:04' | 'Товар без характеристик' | '83890f39-5579-4323-824e-4b5ee7fe0bf2' | 'Да'                |
        | ''                                                         | '03.05.2023 15:18:04' | '2'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 03.05.2023 15:18:04' | 'Товар без характеристик' | '83890f39-5579-4323-824e-4b5ee7fe0bf2' | 'Нет'               |
        | ''                                                         | '03.05.2023 15:18:04' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 03.05.2023 15:18:04' | 'Товар без характеристик' | '83890f39-5579-4323-824e-4b5ee7fe0bf2' | 'Нет'               |
        | ''                                                         | '03.05.2023 15:18:04' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 03.05.2023 15:18:04' | 'Товар без характеристик' | '83890f39-5579-4323-824e-4b5ee7fe0bf2' | 'Нет'               |
        | ''                                                         | '03.05.2023 15:18:04' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 03.05.2023 15:18:04' | 'Товар без характеристик' | '83890f39-5579-4323-824e-4b5ee7fe0bf2' | 'Нет'               |
    
    И я закрываю все окна клиентского приложения
               
Сценарий: _0503 проверка движений документа Поступление товаров по регистру R1021 Взаиморасчеты с поставщиками
    И я закрываю все окна клиентского приложения
    //
    Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
    И в таблице "List" я перехожу к строке
            | 'Номер' |
            | '1 001' |
    //
    И я нажимаю на кнопку с именем 'FormReportDocumentRegistrationsReportRegistrationsReport'
    Тогда открылось окно 'Движения документа'
    И из выпадающего списка с именем "FilterRegister" я выбираю точное значение 'R1021 Взаиморасчеты с поставщиками'
    И я нажимаю на кнопку с именем 'GenerateReport'
    //Тогда табличный документ "ResultTable" равен:
    И табличный документ "ResultTable" содержит строки по шаблону:
        | 'Поступление товаров и услуг 1 001 от 03.05.2023 15:18:04' | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
        | 'Движения документа по регистрам'                          | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
        | 'Регистр  "R1021 Взаиморасчеты с поставщиками"'            | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
        | ''                                                         | 'Record type' | 'Period'              | 'Resources' | 'Dimensions'             | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | 'Attributes'        | ''                             |
        | ''                                                         | ''            | ''                    | 'Сумма'     | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Контрагент'  | 'Партнер'     | 'Соглашение'                 | 'Документ основание' | 'Отложенный расчет' | 'Закрытие авансов поставщиков' |
        | ''                                                         | 'Приход'      | '*'                   | ''          | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Да'                | ''                             |
        | ''                                                         | 'Приход'      | '03.05.2023 15:18:04' | '343,6'     | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
        | ''                                                         | 'Приход'      | '03.05.2023 15:18:04' | '400'       | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
        | ''                                                         | 'Приход'      | '03.05.2023 15:18:04' | '400'       | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
        | ''                                                         | 'Приход'      | '03.05.2023 15:18:04' | '400'       | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
    
    И я закрываю все окна клиентского приложения
    
Сценарий: Подготовка данных

	// Справочник.RowIDs

	И я проверяю или создаю для справочника "RowIDs" объекты:
		| 'Ref'                                                            | 'DeletionMark' | 'Code' | 'Description'                          | 'AgreementSales' | 'Company'                                                           | 'CurrencySales' | 'LegalNameSales' | 'PartnerSales' | 'PriceIncludeTaxSales' | 'Store'                                                          | 'Unit'                                                          | 'ItemKey'                                                          | 'Branch' | 'Basis'                                                                    | 'RowID'                                | 'ProcurementMethod' | 'StoreSender' | 'StoreReceiver' | 'TransactionTypeSC'                                        | 'TransactionTypeGR'                          | 'TransactionType' | 'Requester' | 'AgreementPurchases'                                                 | 'PartnerPurchases'                                                 | 'LegalNamePurchases'                                                | 'PriceIncludeTaxPurchases' | 'CurrencyPurchases'                                                  |
		| 'e1cib/data/Catalog.RowIDs?ref=af28a8a159af068311ede98c24ac2fa3' | 'False'        | 7      | '184fe49c-7902-4438-bf19-20dc71554384' | ''               | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7663e35d7964' | ''              | ''               | ''             | 'False'                | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'e1cib/data/Catalog.ItemKeys?ref=b762b13668d0905011eb766bf96b2751' | ''       | 'e1cib/data/Document.PurchaseInvoice?ref=af28a8a159af068311ede98c24ac2fa5' | '184fe49c-7902-4438-bf19-20dc71554384' | ''                  | ''            | ''              | 'Enum.ShipmentConfirmationTransactionTypes.ReturnToVendor' | 'Enum.GoodsReceiptTransactionTypes.Purchase' | ''                | ''          | 'e1cib/data/Catalog.Agreements?ref=b762b13668d0905011eb76684b9f6871' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794e' | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb766bf96b2771' | 'True'                     | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' |
		| 'e1cib/data/Catalog.RowIDs?ref=af28a8a159af068311ede98c24ac2fa4' | 'False'        | 8      | 'b550ee94-fb23-4726-9e14-fdc27452a4f2' | ''               | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7663e35d7964' | ''              | ''               | ''             | 'False'                | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'e1cib/data/Catalog.ItemKeys?ref=b762b13668d0905011eb766bf96b2753' | ''       | 'e1cib/data/Document.PurchaseInvoice?ref=af28a8a159af068311ede98c24ac2fa5' | 'b550ee94-fb23-4726-9e14-fdc27452a4f2' | ''                  | ''            | ''              | 'Enum.ShipmentConfirmationTransactionTypes.ReturnToVendor' | 'Enum.GoodsReceiptTransactionTypes.Purchase' | ''                | ''          | 'e1cib/data/Catalog.Agreements?ref=b762b13668d0905011eb76684b9f6871' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794e' | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb766bf96b2771' | 'True'                     | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' |

	// Документ.PurchaseInvoice

	И я проверяю или создаю для документа "PurchaseInvoice" объекты:
		| 'Ref'                                                                      | 'DeletionMark' | 'Number' | 'Date'                | 'Posted' | 'Agreement'                                                          | 'Company'                                                           | 'Currency'                                                           | 'DocDate'            | 'DocNumber' | 'LegalName'                                                         | 'Partner'                                                          | 'PriceIncludeTax' | 'IgnoreAdvances' | 'LegalNameContract' | 'Author'                                                        | 'Branch' | 'Description' | 'DocumentAmount' |
		| 'e1cib/data/Document.PurchaseInvoice?ref=af28a8a159af068311ede98c24ac2fa5' | 'False'        | 1002     | '03.05.2023 17:03:47' | 'True'   | 'e1cib/data/Catalog.Agreements?ref=b762b13668d0905011eb76684b9f6871' | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7663e35d7964' | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | '01.01.0001 0:00:00' | ''          | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb766bf96b2771' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794e' | 'True'            | 'False'          | ''                  | 'e1cib/data/Catalog.Users?ref=aa7f120ed92fbced11eb13d7279770c0' | ''       | ''            | 400              |

	И я перезаполняю для объекта табличную часть "ItemList":
		| 'Ref'                                                                      | 'Key'                                  | 'ItemKey'                                                          | 'Store'                                                          | 'PurchaseOrder' | 'Unit'                                                          | 'Quantity' | 'Price' | 'PriceType'                                             | 'TaxAmount' | 'TotalAmount' | 'NetAmount' | 'OffersAmount' | 'ProfitLossCenter' | 'ExpenseType'                                                                    | 'DeliveryDate'       | 'SalesOrder' | 'Detail' | 'AdditionalAnalytic' | 'DontCalculateRow' | 'QuantityInBaseUnit' | 'UseGoodsReceipt' | 'InternalSupplyRequest' |
		| 'e1cib/data/Document.PurchaseInvoice?ref=af28a8a159af068311ede98c24ac2fa5' | '184fe49c-7902-4438-bf19-20dc71554384' | 'e1cib/data/Catalog.ItemKeys?ref=b762b13668d0905011eb766bf96b2751' | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' | ''              | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 2          | 100     | 'e1cib/data/Catalog.PriceTypes?refName=ManualPriceType' | 33.33       | 200           | 166.67      |                | ''                 | ''                                                                               | '01.01.0001 0:00:00' | ''           | ''       | ''                   | 'False'            | 2                    | 'True'            | ''                      |
		| 'e1cib/data/Document.PurchaseInvoice?ref=af28a8a159af068311ede98c24ac2fa5' | 'b550ee94-fb23-4726-9e14-fdc27452a4f2' | 'e1cib/data/Catalog.ItemKeys?ref=b762b13668d0905011eb766bf96b2753' | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' | ''              | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 1          | 200     | 'e1cib/data/Catalog.PriceTypes?refName=ManualPriceType' | 33.33       | 200           | 166.67      |                | ''                 | 'e1cib/data/Catalog.ExpenseAndRevenueTypes?ref=af28a8a159af068311ede98c24ac2f9f' | '01.01.0001 0:00:00' | ''           | ''       | ''                   | 'False'            | 1                    | 'False'           | ''                      |

	И я перезаполняю для объекта табличную часть "TaxList":
		| 'Ref'                                                                      | 'Key'                                  | 'Tax'                                                           | 'Analytics' | 'TaxRate'                                                          | 'Amount' | 'IncludeToTotalAmount' | 'ManualAmount' |
		| 'e1cib/data/Document.PurchaseInvoice?ref=af28a8a159af068311ede98c24ac2fa5' | '184fe49c-7902-4438-bf19-20dc71554384' | 'e1cib/data/Catalog.Taxes?ref=b762b13668d0905011eb7663e35d7970' | ''          | 'e1cib/data/Catalog.TaxRates?ref=b762b13668d0905011eb7663e35d796c' | 33.33    | 'True'                 | 33.33          |
		| 'e1cib/data/Document.PurchaseInvoice?ref=af28a8a159af068311ede98c24ac2fa5' | 'b550ee94-fb23-4726-9e14-fdc27452a4f2' | 'e1cib/data/Catalog.Taxes?ref=b762b13668d0905011eb7663e35d7970' | ''          | 'e1cib/data/Catalog.TaxRates?ref=b762b13668d0905011eb7663e35d796c' | 33.33    | 'True'                 | 33.33          |

	И я перезаполняю для объекта табличную часть "Currencies":
		| 'Ref'                                                                      | 'Key' | 'CurrencyFrom'                                                       | 'Rate' | 'ReverseRate' | 'ShowReverseRate' | 'Multiplicity' | 'MovementType'                                                                                    | 'Amount' | 'IsFixed' |
		| 'e1cib/data/Document.PurchaseInvoice?ref=af28a8a159af068311ede98c24ac2fa5' | ''    | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 1      | 1             | 'False'           | 1              | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796b' | 400      | 'False'   |
		| 'e1cib/data/Document.PurchaseInvoice?ref=af28a8a159af068311ede98c24ac2fa5' | ''    | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 0.859  | 1.1641        | 'False'           | 1              | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796a' | 343.6    | 'False'   |
		| 'e1cib/data/Document.PurchaseInvoice?ref=af28a8a159af068311ede98c24ac2fa5' | ''    | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 1      | 1             | 'False'           | 1              | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d7968' | 400      | 'False'   |
		| 'e1cib/data/Document.PurchaseInvoice?ref=af28a8a159af068311ede98c24ac2fa5' | ''    | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' |        |               | 'False'           |                | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d7969' |          | 'False'   |

	И я перезаполняю для объекта табличную часть "RowIDInfo":
		| 'Ref'                                                                      | 'Key'                                  | 'RowID'                                | 'Quantity' | 'Basis' | 'CurrentStep' | 'NextStep'                                    | 'RowRef'                                                         | 'BasisKey' |
		| 'e1cib/data/Document.PurchaseInvoice?ref=af28a8a159af068311ede98c24ac2fa5' | '184fe49c-7902-4438-bf19-20dc71554384' | '184fe49c-7902-4438-bf19-20dc71554384' | 2          | ''      | ''            | 'e1cib/data/Catalog.MovementRules?refName=GR' | 'e1cib/data/Catalog.RowIDs?ref=af28a8a159af068311ede98c24ac2fa3' | ''         |
		| 'e1cib/data/Document.PurchaseInvoice?ref=af28a8a159af068311ede98c24ac2fa5' | 'b550ee94-fb23-4726-9e14-fdc27452a4f2' | 'b550ee94-fb23-4726-9e14-fdc27452a4f2' | 1          | ''      | ''            | ''                                            | 'e1cib/data/Catalog.RowIDs?ref=af28a8a159af068311ede98c24ac2fa4' | ''         |



        
