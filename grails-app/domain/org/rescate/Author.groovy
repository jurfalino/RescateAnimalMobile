package org.rescate

class Author {
    static hasMany = [books: Book]
    String name
}