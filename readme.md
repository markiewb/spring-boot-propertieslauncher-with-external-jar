Example for a self-executable Spring Boot JAR, which accesses a DB driver (or any other 3rd-party JAR) from a external (non-bundled) directory. 

This may be useful if you are not allowed to bundle the DB driver with your application.

Tips:
* Use `ZIP` as layout in `spring-boot-maven-plugin` (to generate the `PropertiesLauncher` entry in the `MANIFEST.MF`)
* Set `<executable>true</executable>` to prepend a shell script to the resulting JAR
* See [command line examples](run.sh) for different types of running the JAR using the `loader.path` option