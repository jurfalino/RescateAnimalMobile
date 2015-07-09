package org.rescate

class Book {
    static belongsTo = [author: Author]
    String title
}