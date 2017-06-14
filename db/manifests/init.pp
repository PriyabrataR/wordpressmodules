class db {
class { '::mysql::server':
  root_password           => 'strongpassword',
}

class {'::mysql::client':
  bindings_enable => true,
}

mysql::db { 'mydb':
  user     => 'myuser',
  password => 'mypass',
  host     => 'localhost',
  grant    => ['ALL'],
}
}

