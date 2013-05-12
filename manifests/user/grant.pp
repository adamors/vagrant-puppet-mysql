define mysql::user::grant ($user = $title, $host, $database, $table = '*', $permission = 'ALL PRIVILEGES') {
  exec { "mysql_user_grant_${user}@${host}_${database}.${table}_${permission}":
    command => "mysql -uroot -p${mysql::root_password} -e \"GRANT ${permission} ON ${database}.${table} TO '${user}'@'${host}'; FLUSH PRIVILEGES;\"",
    path    => $mysql::bin,
    require => Exec['mysql_set_root'],
  }
}

