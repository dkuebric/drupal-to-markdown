require "jekyll-import";

JekyllImport::Importers::Drupal7.run({
  "dbname"   => "DRUPAL_DB_NAME",
  "user"     => "USER",
  "password" => "PASSWORD",
  "host"     => "DB_HOST",
  "prefix"   => "",
  "types"    => ["book", "appliance_release_notes", "diagnostic_message", "internal_kb", "page", "pathview_release_notes", "pca_release_notes", "snippet"]
})
