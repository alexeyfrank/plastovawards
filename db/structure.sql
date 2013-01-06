CREATE TABLE "ckeditor_assets" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "data_file_name" varchar(255) NOT NULL, "data_content_type" varchar(255), "data_file_size" integer, "assetable_id" integer, "assetable_type" varchar(30), "type" varchar(30), "width" integer, "height" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "menu_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "slug" varchar(255), "ancestry" varchar(255), "klass" varchar(255), "menu_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "position" integer);
CREATE TABLE "menus" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "pages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "author_id" integer, "title" varchar(255), "content" varchar(255), "state" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "slug" varchar(255));
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "settings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "var" varchar(255) NOT NULL, "value" text, "target_id" integer, "target_type" varchar(30), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "taggings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "tag_id" integer, "taggable_id" integer, "taggable_type" varchar(255), "tagger_id" integer, "tagger_type" varchar(255), "context" varchar(128), "created_at" datetime);
CREATE TABLE "tags" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255));
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255), "password_digest" varchar(255), "first_name" varchar(255), "last_name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "idx_ckeditor_assetable" ON "ckeditor_assets" ("assetable_type", "assetable_id");
CREATE INDEX "idx_ckeditor_assetable_type" ON "ckeditor_assets" ("assetable_type", "type", "assetable_id");
CREATE INDEX "index_menu_items_on_ancestry" ON "menu_items" ("ancestry");
CREATE INDEX "index_menu_items_on_menu_id" ON "menu_items" ("menu_id");
CREATE INDEX "index_menu_items_on_position" ON "menu_items" ("position");
CREATE INDEX "index_menus_on_name" ON "menus" ("name");
CREATE INDEX "index_pages_on_author_id" ON "pages" ("author_id");
CREATE INDEX "index_pages_on_slug" ON "pages" ("slug");
CREATE INDEX "index_pages_on_state" ON "pages" ("state");
CREATE INDEX "index_pages_on_title" ON "pages" ("title");
CREATE UNIQUE INDEX "index_settings_on_target_type_and_target_id_and_var" ON "settings" ("target_type", "target_id", "var");
CREATE INDEX "index_taggings_on_tag_id" ON "taggings" ("tag_id");
CREATE INDEX "index_taggings_on_taggable_id_and_taggable_type_and_context" ON "taggings" ("taggable_id", "taggable_type", "context");
CREATE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20121201172922');

INSERT INTO schema_migrations (version) VALUES ('20121210190231');

INSERT INTO schema_migrations (version) VALUES ('20121210191148');

INSERT INTO schema_migrations (version) VALUES ('20121213232119');

INSERT INTO schema_migrations (version) VALUES ('20121215151604');

INSERT INTO schema_migrations (version) VALUES ('20121217071945');

INSERT INTO schema_migrations (version) VALUES ('20121217072033');

INSERT INTO schema_migrations (version) VALUES ('20121217081856');

INSERT INTO schema_migrations (version) VALUES ('20121217103912');