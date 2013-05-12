define mysql::user::drop ($user = $title, $host) {
  exec { "mysql_user_drop_${user}@${host}":
    command => "mysql -uroot -p${mysql::root_password} -e \"DELETE FROM `mysql`.`user` WHERE `user` = '${user}' AND `host` = '${host}'\"",
    returns => '1',
    unless  => "mysql -uroot -p${mysql::root_password} -e \"SELECT EXISTS(SELECT `user` FROM `mysql`.`user` WHERE `user` = '${user}' AND `host` = '${host}');\"",
    path    => $mysql::bin,
    require => Exec['mysql_set_root'],
  }
}

