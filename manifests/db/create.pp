define mysql::db::create ($dbname = $title) {
  exec { "mysql::db::create_${dbname}":
    command => "mysql -uroot -p${mysql::root_password} -e \"CREATE DATABASE IF NOT EXISTS ${dbname} CHARACTER SET utf8 COLLATE utf8_general_ci\"",
    path    => $mysql::bin,
    require => Exec['mysql::set_root_password'],
  }
}

