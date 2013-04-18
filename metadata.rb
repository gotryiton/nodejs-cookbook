maintainer       "Go Try It On, Inc."
maintainer_email "scott@gotryiton.com"
license          "Apache 2.0"
description      "Installs/Configures nodejs"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "1.0.0"
recipe           "nodejs", "Installs Node.JS from source"

depends          "build-essential"
