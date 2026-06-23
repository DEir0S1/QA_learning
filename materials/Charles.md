# Функциональности Charles Proxy

### Фильтрация запросов
Фильтрация позволяет отображать только нужные запросы по домену, методу, статусу или тексту через поле Focus или фильтры в Structure/Sequence. Тестировщик использует для изоляции трафика конкретного API (например, только /auth/*), ускоряя анализ в больших сессиях.

### Работа с логами
Логи — это сессии запросов/ответов (Sequence/Structure views), с экспортом в .chls, HAR, cURL. Позволяет сохранять, воспроизводить и анализировать историю (Overview, Contents, Charts). Задачи: регрессионное тестирование (сравнение сессий до/после фикса), отчётность багов с полными запросами. 

### Работа с зашифрованным трафиком
SSL Proxying расшифровывает HTTPS как Man-in-the-Middle: Charles генерирует сертификат, подменяет трафик. Включите Enable SSL Proxying + locations. Тестировщик проверяет защищённые API (токены, данные в мобильных apps), тестирует безопасность без реального сервера.

### Map Remote
Перенаправляет запросы с одного хоста/пути на другой (Tools -> Map Remote). Задачи: тестирование на staging/prod серверах (redirect /api на mock), A/B-тесты backend-версий без код-чейнджей. 

### Breakpoint
Перехватывает запрос/ответ для ручного редактирования (правый клик -> Breakpoint). Задачи: быстрая подмена параметров (статус-код 500 на 200), отладка edge-кейсов в реал-тайм без локальных mock. 

### Rewrite
Мощные правила для изменения заголовков/тела (Enable Rewrite -> Location -> Match/Replace). Задачи: массовые правки (замена строк в JSON, добавление headers), симуляция ошибок сервера в тестах.

### Throttling
Имитирует сеть (Tools -> Throttling: bandwidth, latency, drop rate). Задачи: тест оффлайн-режима, производительности на 3G/плохом соединении, стабильности мобильных apps.

# Практика использования

**Тестовый интернет-магазин:** [nopCommerce](https://demo.nopcommerce.com/)

## Breakpoints

[Видео](https://drive.google.com/file/d/19uuwmajnsdgnyb3-NopFzomOWKtcUVXT/view?usp=drive_link)

## Map Local

[Видео](https://drive.google.com/file/d/15o5-j-7wFuudkbSatwRphq5anDB36TKM/view?usp=drive_link)

## Rewrite

[Видео](https://drive.google.com/file/d/1S34bv8zKuutVj5fU2IJm74lZGJOzWTun/view?usp=drive_link)

## Throttle

[Видео](https://drive.google.com/file/d/1DpnSw18QYhPFfFLhfDalP6ajWJcycj8l/view?usp=drive_link)

*Страница загружалась ощутимо дольше; сначала отобразился "голый" HTML, потом подгрузились стили, позже - иконки, изображения прогружались как слайд-шоу.*

#### Задание выполнено на тестовом сайте

Тестовые сайты  не имеют защиты и отдают чистый JSON/HTML. Реальные магазины используют защиту от MITM (man-in-the-middle); используют CDN, Service Workers, CSP, HSTS, кэширование, сжатие и собственные прокси, которые обходят Charles или блокируют его действия. Плюс HTTPS-сертификаты, фильтры браузера и динамическая генерация цен на клиенте.