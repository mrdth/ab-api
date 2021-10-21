-- CreateTable
CREATE TABLE "authors" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "goodreads_id" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "sort_name" TEXT,
    "name_last_first" TEXT,
    "sort_name_last_first" TEXT,
    "bio" TEXT,
    "images" TEXT,
    "created_at" DATETIME,
    "updated_at" DATETIME
);

-- CreateTable
CREATE TABLE "book_book_list" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "book_id" INTEGER NOT NULL,
    "book_list_id" INTEGER NOT NULL,
    "created_at" DATETIME,
    "updated_at" DATETIME
);

-- CreateTable
CREATE TABLE "book_lists" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "description" TEXT,
    "user_id" INTEGER NOT NULL,
    "public" INTEGER NOT NULL DEFAULT 0,
    "created_at" DATETIME,
    "updated_at" DATETIME,
    CONSTRAINT "book_lists_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "book_tag" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "book_id" INTEGER NOT NULL,
    "tag_id" INTEGER NOT NULL,
    "created_at" DATETIME,
    "updated_at" DATETIME
);

-- CreateTable
CREATE TABLE "books" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "author_id" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "goodreads_id" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "overview" TEXT,
    "links" TEXT,
    "images" TEXT,
    "ratings" TEXT,
    "release_date" DATETIME,
    "created_at" DATETIME,
    "updated_at" DATETIME,
    CONSTRAINT "books_author_id_fkey" FOREIGN KEY ("author_id") REFERENCES "authors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "tags" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "text" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "created_at" DATETIME,
    "updated_at" DATETIME
);

-- CreateTable
CREATE TABLE "users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "is_admin" INTEGER,
    "email_verified_at" DATETIME,
    "password" TEXT NOT NULL,
    "remember_token" TEXT,
    "created_at" DATETIME,
    "updated_at" DATETIME
);

-- CreateIndex
CREATE UNIQUE INDEX "authors_slug_key" ON "authors"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "book_lists_slug_key" ON "book_lists"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "books_slug_key" ON "books"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_unique" ON "users"("email");
