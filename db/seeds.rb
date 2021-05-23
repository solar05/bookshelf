# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if ENV['RAILS_ENV'] != 'test'
  puts 'Seeding database...'
  first_user = User.create({ email: 'some@mail', password: 'password' })
  second_user = User.create({ email: 'sicp@sicp', password: 'password' })
  puts 'Users seeded succesfully!'

  first_book = Book.new({ name: 'SICP', authors: 'Гарольд Абельсон и Джеральд Джей Сассман',
                          annotation: '«Структу́ра и интерпрета́ция компью́терных програ́мм» — классическая книга Харольда Абельсона и Джеральда Сассмана о программировании, выпущенная издательством Массачусетского технологического института в 1985 году.' })
  first_book.user = first_user
  first_book.cover.attach(io: File.open('db/covers/SICP_cover.jpg'), filename: 'sicp.jpg')
  first_book.save

  second_book = Book.new({ name: 'Код: тайный язык информатики', authors: 'Чарльз Петцольд',
                           annotation: 'Хотя современные компьютеры и сложнее, чем компьютеры четвертьвековой или полувековой давности, фундаментально они не изменились. Вот почему изучать историю техники так здорово: чем сильнее углубляешься в прошлое, тем проще становятся технологии. Поэтому легко добраться до точки, где понятно решительно все. Автор книги «Код» заглянул настолько далеко в прошлое, что добрался до XIX века и на примере первых телеграфных машин объяснил устройство компьютера. Теоретически вся техника из первых 17 глав «Кода» легко собирается из простейших электрических компонентов, которые в ходу уже более века.' })
  second_book.user = first_user
  second_book.cover.attach(io: File.open('db/covers/code.jpg'), filename: 'code.jpg')
  second_book.save

  third_book = Book.new({ name: 'Архитектура компьютера', authors: 'Эндрю Танненбаум',
                          annotation: 'Книга Эндрю Таненбаума, всемирно известного специалиста в области информационных технологий, писателя и преподавателя, выходящая уже в шестом издании, посвящена структурной организации компьютера. В ее основе лежит идея иерархической структуры, в которой каждый уровень выполняет вполне определенную функцию. В рамках этого нетрадиционного подхода подробно описываются цифровой логический уровень, уровень архитектуры команд, уровень операционной системы и уровень языка ассемблера. В шестое издание внесены многочисленные изменения, которые приводят книгу в соответствие со стремительным развитием компьютерной отрасли. В частности, была обновлена информация о машинах, представленных в качестве примеров: Intel Core i7, Texas Instrument OMAP4430 и Atmel ATmega168.' })
  third_book.user = first_user
  third_book.cover.attach(io: File.open('db/covers/architecture.jpg'), filename: 'architecture.jpg')
  third_book.save

  fourth_book = Book.new({ name: 'Алгоритмы: построение и анализ',
                           authors: 'Томас Кормен, Чарльз Эрик Лейзерсон, Рональд Линн Ривест, Клиффорд Штайн', annotation: 'Алгори́тмы: построе́ние и ана́лиз — книга по алгоритмам и структурам данных, написанная Томасом Корменом, Чарльзом Лейзерсоном, Рональдом Ривестом и Клиффордом Штайном. Книга используется во многих учебных заведениях в качестве пособия и справочника, на книгу имеется более 4000 ссылок на CiteSeerX.' })
  fourth_book.user = first_user
  fourth_book.cover.attach(io: File.open('db/covers/algorithms.jpg'), filename: 'algorithms.jpg')
  fourth_book.save

  fifth_book = Book.new({ name: 'HTDP',
                          authors: 'Роберт Брюс Финдлер, Маттиас Феллейзен, Мэттью Флатт, Шрирам Кришнамурти', annotation: 'Как разрабатывать программы - это учебник Маттиаса Феллайзена, Роберта Брюса Финдлера, Мэтью Флатта и Шрирама Кришнамурти о систематическом проектировании компьютерных программ. MIT Press опубликовала первое издание в 2001 году, а второе издание в 2018 году, которое свободно доступно в Интернете и в печатном виде.' })
  fifth_book.user = first_user
  fifth_book.cover.attach(io: File.open('db/covers/htdp.jpg'), filename: 'htdp.jpg')
  fifth_book.save

  six_book = Book.new({ name: 'Типы в языках программирования', authors: 'Бенджамин Пирс',
                        annotation: 'Книга будет полезна как для практикующих разработчиков, так и для студентов и аспирантов в области информатики.' })
  six_book.user = first_user
  six_book.cover.attach(io: File.open('db/covers/tapl.jpg'), filename: 'tapl.jpg')
  six_book.save

  seventh_book = Book.new({ name: 'Операционная система Unix',
                            authors: 'Робачевский Андрей, Стесик Ольга Львовна, Немнюгин Сергей Андреевич', annotation: 'Книга является вторым изданием рекомендованного Министерством общего и профессионального образования России одноименного учебного пособия. Даны основы организации, идеологии и архитектуры, объединяющие различные версии UNIX. Рассматриваются: архитектура ядра (подсистемы ввода/вывода, управления памятью и процессами, а также файловая подсистема), программный интерфейс (системные вызовы и основные библиотечные функции), пользовательская среда (командный интерпретатор shell, основные команды и утилиты).' })
  seventh_book.user = second_user
  seventh_book.cover.attach(io: File.open('db/covers/unix.jpg'), filename: 'unix.jpg')
  seventh_book.save

  puts 'Books seeded succesfully!'
  puts 'Seeding done!'
end
