class wordpress::wp { 


exec { 'wget https://wordpress.org/latest.tar.gz -O /tmp/latest.tar.gz': 
path => ['/usr/bin'] 

}

exec { 'extract': 
cwd => "/tmp", 
command => "tar -xvzf latest.tar.gz", 
require => Exec['wget https://wordpress.org/latest.tar.gz -O /tmp/latest.tar.gz'], 
path => ['/bin'], 
}

exec { 'copy': 
command => "cp -r /tmp/wordpress/* /var/www/html/", 
require => Exec['extract'], 
path => ['/bin'], 
}
 
file {'/var/www/html/index.html': 
ensure => absent 
}

file { '/var/www/wp-config.php': 
ensure => present, 
require => Exec['copy'], 
content => template("wordpress/wp-config-sample.php.erb") 
}

}
