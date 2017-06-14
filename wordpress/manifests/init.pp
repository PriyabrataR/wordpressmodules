class wordpress {

class { 'wordpress::web' :}

class { 'wordpress::db'  :}

class { 'wordpress::wp' :}

}

