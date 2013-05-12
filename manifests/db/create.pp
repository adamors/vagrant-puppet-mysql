define mysql::db::create ($dbname = $title) {
  exec { "mysql_db_create_${dbname}":
    command => "mysql -uroot -p${mysql::root_password} -e \"CREATE DATABASE IF NOT EXISTS ${dbname}\"",
    path    => $mysql::bin,
    require => Exec['mysql_set_root'],
  }
}

