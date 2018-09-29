mvn clean package -DskipTests 

# https://docs.spring.io/spring-boot/docs/2.0.x/reference/html/executable-jar.html#executable-jar-launching
# The PropertiesLauncher looks in BOOT-INF/lib/ in your application archive by default, but you can add additional locations by setting an environment variable called LOADER_PATH or loader.path in loader.properties (which is a comma-separated list of directories, archives, or directories within archives).

# https://docs.spring.io/spring-boot/docs/current/reference/html/executable-jar.html#executable-jar-property-launcher-features

current=`pwd`

echo --------------------------
echo Variant A via "java -jar"
echo --------------------------
java -Dloader.path=$current/externallibs/ -jar ./target/x-0.0.1-SNAPSHOT.jar 

echo --------------------------
echo Variant B via "java -jar"
echo --------------------------
java -Dloader.path=$current/externallibs/h2-1.4.197.jar -jar ./target/x-0.0.1-SNAPSHOT.jar 

echo ------------------------------------------------------------------------------------------------
echo Variant C via "self-executable and loader.path-configuration from (default-) loader.properties"
echo ------------------------------------------------------------------------------------------------
echo loader.path=$current/externallibs/h2-1.4.197.jar > ./target/loader.properties
./target/x-0.0.1-SNAPSHOT.jar
rm ./target/loader.properties

echo --------------------------------------------------------------------------------------------
echo Variant D via "self-executable and loader.path-configuration from different property file "
echo --------------------------------------------------------------------------------------------
export LOADER_CONFIG_LOCATION=otherloader.properties
echo loader.path=$current/externallibs/h2-1.4.197.jar > ./target/otherloader.properties
./target/x-0.0.1-SNAPSHOT.jar
unset LOADER_CONFIG_LOCATION
rm ./target/otherloader.properties

echo ------------------------------------------------------------
echo Variant E via "self-executable and LOADER_PATH environment"
echo ------------------------------------------------------------
export LOADER_PATH=$current/externallibs/h2-1.4.197.jar
./target/x-0.0.1-SNAPSHOT.jar

 
