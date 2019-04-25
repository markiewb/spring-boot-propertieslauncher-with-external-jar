Example for a self-executable Spring Boot JAR, which accesses a DB driver (or any other 3rd-party JAR) from a external (non-bundled) directory. 

This may be useful if you are not allowed to bundle the DB driver with your application.

Tips:
* Use `ZIP` as layout in `spring-boot-maven-plugin` (to generate the `PropertiesLauncher` entry in the `MANIFEST.MF`)
* Set `<executable>true</executable>` to prepend a shell script to the resulting JAR
* See [command line examples](run.sh) for different types of running the JAR using the `loader.path` option


## Expected result

Have a look for the output 

```
Try to use external driver
-------------> Found driver h2 1.4
```
in all variants. The same application is started using different types of loading an external jar. 

```
--------------------------
Variant A via java -jar
--------------------------
...
2019-04-25 22:51:59.934  INFO 26947 --- [           main] com.example.x.Application                : Started Application in 6.005 seconds (JVM running for 6.465)
Try to use external driver
-------------> Found driver h2 1.4

--------------------------
Variant B via java -jar
--------------------------
...
2019-04-25 22:52:06.447  INFO 26948 --- [           main] com.example.x.Application                : Started Application in 5.996 seconds (JVM running for 6.456)
Try to use external driver
-------------> Found driver h2 1.4

------------------------------------------------------------------------------------------------
Variant C via self-executable and loader.path-configuration from (default-) loader.properties
------------------------------------------------------------------------------------------------
...
Try to use external driver
-------------> Found driver h2 1.4

--------------------------------------------------------------------------------------------
Variant D via self-executable and loader.path-configuration from different property file 
--------------------------------------------------------------------------------------------
...
2019-04-25 22:52:19.494  INFO 26979 --- [           main] com.example.x.Application                : Started Application in 6.005 seconds (JVM running for 6.453)
Try to use external driver
-------------> Found driver h2 1.4

------------------------------------------------------------
Variant E via self-executable and LOADER_PATH environment
------------------------------------------------------------
...
2019-04-25 22:52:26.024  INFO 26995 --- [           main] com.example.x.Application                : Started Application in 5.967 seconds (JVM running for 6.439)
Try to use external driver
-------------> Found driver h2 1.4
```
