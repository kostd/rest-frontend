#kostd`s restaurant-frontend

Заготовка frontend для ресторана с меню и заказами.
Визуальный ux-дизайн навеян приложением  YamiYami, https://yamiyami.ru/
Частично переиспользованы компоненты, ранее разработанные для tasklist_lite, https://github.com/argustelecom/tasklist_lite
Использованы бесплатные иконки <a href="https://www.flaticon.com/free-icons/town" title="Flaticon icons">с ресурса Flaticon</a>

#Особенности && фиченьки
- state management с использованием cubit и flutter_bloc
- get для управления зависимостями
- навигация 2.0 (Nav2 aka Router)
- адаптивная ("responsive") компоновка для малых и больших экранов
- централизованное управление цветом виджетов через ColorScheme и темы
- package by layer и разделение по слоям в терминах clean architecture
- логгирование и заготовка простейшего отчета об ошибке
- поддержка "демо-режима" и фикстур данных для ознакомления с приложением без наличия backend`а
#Сборка и запуск

##TODO:
#Ближайшие планы

- Клиент graphql и полноценнвй деморежим (с возможностью выбора)
- Форма блюда (сейчас при переходе из карточки открывается форма-заглушка)
- Полноценные фотки блюд 
- Суперкатегория "все меню"
- Темная тема. Выбор темы
- Корзина работает: можно добавить блюдо в корзину, убрать из корзины, просмотреть корзину.
- Заказы. Repackaging в сторону комбинации by feature + by layer.
- lint или другой способ недопущения неправильных зависимостей между слоями

#Sources packaging
На данный момент приложение содержит всего одну фичу (menu) верхнего уровня, поэтому package by 
feature не имеет смысла. После появления следующей фичи (заказы, orders) это изменится. 
Сейчас имеются такие packages верхнего уровня:

### config. Конфигурация приложения
в терминах чистой архитектуры (см. https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47 ) сюда
попадает все, что можно считать настройкой конкретного приложения. Например, цветовая схема используемых тем, или маршруты страниц
(у нас они описаны рядом с кодом самих страниц).
От config могут зависеть все слои: core, data, domain, presentation
Сама конфигурация "слоем" в терминах чистой архитектуры не является, это просто вспомогательный код.

### data
Слой data в терминах чистой архитектуры.
Может зависеть от conf, core и слоя domain. Ничего не знает про presentation, как и presentation не знает про data.
Содержит реализацию репозиториев, интерфейсная часть которых размещена в слое domain (см. далее).
Также содержит реализацию двух вариантов доступа к данным: фикстуры (в демо-режиме) и remote-graphql-клиенты.

### domain
Может зависеть от core и conf. Остальные слои (data и presentation) зависят от него. 
Содержит модель данных, с которой работает приложение. Содержит объявление (интерфейсную часть) репозиториев. 
Слой data содержит реализацию этих репозиториев и зависит от domain. Слой presentation использует репозиторий, 
объявляя зависимость от интерфейса. Так и data и presentation зависят от domain и не зависят друг от друга. 

### presentation. Слой представления
Слой представления в терминах чистой архитектуры. От содержимого этого package не должно зависеть ничего извне его
Он сам может зависеть от domain, core, conf. Состоит из:
 - pages -- описание страниц приложения.
 - dialogs -- диалоги, то есть просто модальные страницы. Вынесены в отдельный package из соображений удобства группировки. Поведение такое же, как у pages
 - widgets -- кирпичики, из которых состоят страницы и диалоги. 
 - state -- классы, описывающие состояние приложения.
 - logic -- содержит логику представления. Разработчики bloc почему-то называют это бизнес-логикой (bloc  -- business logic component), но это вопрос дискуссионный.
   


