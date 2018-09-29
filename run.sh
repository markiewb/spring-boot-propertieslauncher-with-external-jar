mvn clean package -DskipTests 

# https://docs.spring.io/spring-boot/docs/2.0.x/reference/html/executable-jar.html#executable-jar-launching
# The PropertiesLauncher looks in BOOT-INF/lib/ in your application archive by default, but you can add additional locations by setting an environment variable called LOADER_PATH or loader.path in loader.properties (which is a comma-separated list of directories, archives, or directories within archives).

current=`pwd`

echo --------------------------
echo Variante A via "java -jar"
echo --------------------------
java -Dloader.path=$current/externallibs/ -jar ./target/x-0.0.1-SNAPSHOT.jar 

echo --------------------------
echo Variante B via "java -jar"
echo --------------------------
java -Dloader.path=$current/externallibs/h2-1.4.197.jar -jar ./target/x-0.0.1-SNAPSHOT.jar 

echo ------------------------------------------------------
echo Variante C via "self-executable and loader.properties"
echo ------------------------------------------------------
echo loader.path=$current/externallibs/h2-1.4.197.jar > ./target/loader.properties
./target/x-0.0.1-SNAPSHOT.jar
 
