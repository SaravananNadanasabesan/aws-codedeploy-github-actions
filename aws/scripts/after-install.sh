#!/bin/bash
set -xe

# Define variables
WAR_NAME=SpringBootHelloWorldExampleApplication.war
S3_BUCKET=codedeploystacklab3-saravan-webappdeploymentbucket-u8nnusmih6oi
TOMCAT_WEBAPPS_DIR=/opt/tomcat/webapps

# Download the WAR file from S3
echo "Downloading $WAR_NAME from S3 bucket: $S3_BUCKET"
aws s3 cp s3://$S3_BUCKET/$WAR_NAME $TOMCAT_WEBAPPS_DIR/$WAR_NAME

# Set permissions (optional if Tomcat runs as ec2-user)
chown -R tomcat:tomcat $TOMCAT_WEBAPPS_DIR
