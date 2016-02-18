#!/bin/bash

SERVER_CONF_FILE="/etc/tomcat8/server.xml"
KEYSTORE_FILE="/etc/tomcat8/server.jks"
DEFAULT_PASS="password"

#
# Check if a user defined store and key pass are supplied
#
if [ -z ${PASSWORD} ]; then
	echo "Using default STORE_PASS: ${DEFAULT_PASS}"
	PASSWORD=${DEFAULT_PASS}
else
	echo "Using supplied PASSWORD"
fi

#
# Generate SSL certificate if the keystore does not exist
#
if [ -f ${KEYSTORE_FILE} ]; then
	echo "Using existing ssl certificate from ${KEYSTORE_FILE}"
else
	echo "Generating new ssl certificate in ${KEYSTORE_FILE}"
	keytool -genkey \
		-keyalg RSA \
		-alias selfsigned \
		-keystore ${KEYSTORE_FILE} \
 		-storepass ${PASSWORD} \
		-validity 360 \
		-keysize 2048 \
		-noprompt \
		-dname "cn=clarin.eu, ou=CLARIN, o=CLARIN-ERIC, c=NL" \
		-keypass ${PASSWORD}
	
	#Exit if keytool command failed
	rc=$?;
	if [[ $rc != 0 ]]; then
		echo "Failed to generate ssl certificate";
		exit $rc;
	fi

	#update server.xml with correct keystore pass
	if [ "${PASSWORD}" != "password" ]; then
		echo "Changing keystorepass in ${SERVER_CONF_FILE}" 
		#sed -i "s/keystorePass=\"password\"/keystorePass=\"${PASSWORD}\"/g" ${SERVER_CONF_FILE}
		sed -i "s/password/${PASSWORD}/g" ${SERVER_CONF_FILE}
	fi
fi

#
# Start tomcat in foreground
#
echo "Starting tomcat"
/usr/share/tomcat8/bin/catalina.sh run
