//
//  Enum.swift
//  HardMad lab2
//
//  Created by Gleb Korotkov on 23.03.2025.
//

import Foundation

enum BookType {
    static let bookLibrary: [Book] = [
        Book(image: "BookWelcomeScreen 1", title: "ПРОГРАММИРОВАНИЕ НА KOTLIN\nДЛЯ ANDROID",
             author: "Пьер-Оливье Лоранс, Аманда Хинчман-Домингес"),
        Book(image: "BookWelcomeScreen 2", title: "ЧИСТЫЙ КОД: СОЗДАНИЕ, АНАЛИЗ И РЕФАКТОРИНГ",
             author: "Роберт Мартин"),
        Book(image: "BookWelcomeScreen 3", title: "Swift. Карманный справочник: программирование в среде iOS..",
             author: "Роберт Мартин"),
        Book(image: "BookWelcomeScreen 1", title: "Собачье сердце", author: "Роберт Мартин"),
        Book(image: "BookWelcomeScreen 2", title: "ТРИ ТОВАРИЩА", author: "Роберт Мартин")
    ]

    static let bookSearchResult: [Book] = [
        Book(image: "BookWelcomeScreen 1", title: "ПРОГРАММИРОВАНИЕ НА KOTLIN\nДЛЯ ANDROID",
             author: "Пьер-Оливье Лоранс, Аманда Хинчман-Домингес"),
        Book(image: "BookWelcomeScreen 1", title: "ЧИСТЫЙ КОД: СОЗДАНИЕ, АНАЛИЗ И \nРЕФАКТОРИНГ",
             author: "Роберт Мартин")
    ]

    static let bookFavorite: [Book] = [
        Book(image: "BookWelcomeScreen 1", title: "ПРОГРАММИРОВАНИЕ НА KOTLIN\nДЛЯ ANDROID",
             author: "Пьер-Оливье Лоранс, Аманда Хинчман-Домингес"),
        Book(image: "BookWelcomeScreen 1", title: "ЧИСТЫЙ КОД: СОЗДАНИЕ, АНАЛИЗ И \nРЕФАКТОРИНГ",
             author: "Роберт Мартин")
    ]

    static let quoteFavorite: [Quote] = [
        Quote(quote: "Я все еще жив", book: "Код да Винчи", author: "Дэн Браун"),
        Quote(quote: "Высокий, широкоплечий, с мертвенно-бледной кожей и редкими белыми волосами",
              book: "Код да Винчи", author: "Дэн Браун")
    ]
}

enum ChapterTextData {
    static let codeDaVinciProlog = DetailsBook(
        title: "КОД ДА ВИНЧИ",
        chapter: "Пролог",
        text: """
        Париж, Лувр 21.46
        Знаменитый куратор Жак Соньер, пошатываясь, прошел под сводчатой аркой Большой галереи и устремился
        к первой попавшейся ему на глаза картине, полотну Караваджо. Ухватился руками за позолоченную раму
        и стал тянуть ее на себя, пока шедевр не сорвался со стены и не рухнул на семидесятилетнего старика Соньера,
        погребя его под собой.

        Как и предполагал Соньер, неподалеку с грохотом опустилась металлическая решетка,
        преграждающая доступв этот зал. Паркетный пол содрогнулся. Где-то завыла сирена сигнализации.

        Несколько секунд куратор лежал неподвижно, хватая ртом воздух и пытаясь сообразить, на каком свете находится.
        Я все еще жив.
        Потом он выполз из-под полотна и начал судорожно озираться в поисках места, где можно спрятаться.

        Голос прозвучал неожиданно близко:
        - Не двигаться.

        Стоявший на четвереньках куратор похолодел, потом медленно обернулся.
        Всего в пятнадцати футах от него, за решеткой,
        высилась внушительная и грозная фигура его преследователя. Высокий, широкоплечий...
        """
    )
}

struct BookDetails: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let author: String
    let description: String
    let progressValue: Double
}

struct Chapter: Identifiable {
    let id = UUID()
    let title: String
    let read: Bool
    let nowReading: Bool
}

enum BookDetailsData {
    static let bookDetails =
    BookDetails(
        image: "CodeDV",
        title: "КОД ДА ВИНЧИ",
        author: "Дэн Браун",
        description: """
            Секретный код скрыт в работах Леонардо да Винчи...

            Только он поможет найти христианские святыни, дающие немыслимые власть и могущество...

            Ключ к величайшей тайне, над которой человечество билось веками, наконец может быть найден...
            """,
        progressValue: 0.2
    )

    static let chapters: [Chapter] = [
        Chapter(title: "Факты", read: true, nowReading: false),
        Chapter(title: "Пролог", read: false, nowReading: true),
        Chapter(title: "Глава 1", read: false, nowReading: false),
        Chapter(title: "Глава 2", read: false, nowReading: false),
        Chapter(title: "Глава 3", read: false, nowReading: false),
        Chapter(title: "Глава 4", read: false, nowReading: false),
        Chapter(title: "Глава 5", read: false, nowReading: false),
        Chapter(title: "Глава 6", read: false, nowReading: false),
        Chapter(title: "Глава 7", read: false, nowReading: false),
        Chapter(title: "Глава 8", read: false, nowReading: false),
        Chapter(title: "Глава 9", read: false, nowReading: false),
        Chapter(title: "Глава 10", read: false, nowReading: false),
        Chapter(title: "Глава 11", read: false, nowReading: false),
        Chapter(title: "Глава 12", read: false, nowReading: false),
        Chapter(title: "Глава 13", read: false, nowReading: false),
        Chapter(title: "Глава 14", read: false, nowReading: false),
        Chapter(title: "Эпилог", read: false, nowReading: false)
    ]

    static let noReadChapters: [Chapter] = [
        Chapter(title: "Факты", read: false, nowReading: false),
        Chapter(title: "Пролог", read: false, nowReading: true),
        Chapter(title: "Глава 1", read: false, nowReading: false),
        Chapter(title: "Глава 2", read: false, nowReading: false),
        Chapter(title: "Глава 3", read: false, nowReading: false),
        Chapter(title: "Глава 4", read: false, nowReading: false),
        Chapter(title: "Глава 5", read: false, nowReading: false),
        Chapter(title: "Глава 6", read: false, nowReading: false),
        Chapter(title: "Глава 7", read: false, nowReading: false),
        Chapter(title: "Глава 8", read: false, nowReading: false),
        Chapter(title: "Глава 9", read: false, nowReading: false),
        Chapter(title: "Глава 10", read: false, nowReading: false),
        Chapter(title: "Глава 11", read: false, nowReading: false),
        Chapter(title: "Глава 12", read: false, nowReading: false),
        Chapter(title: "Глава 13", read: false, nowReading: false),
        Chapter(title: "Глава 14", read: false, nowReading: false),
        Chapter(title: "Эпилог", read: false, nowReading: false)
    ]
}

struct DetailsBook {
    let title: String
    let chapter: String
    let text: String
}

struct Book {
    let image: String
    let title: String
    let author: String
}

struct Quote {
    let quote: String
    let book: String
    let author: String
}
