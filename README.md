# Automation_Project
This project is for installing apache v2 webserver and cp the logs to S3 bucket.

Step 1 Perform an update of the package details and the package list at the start of the script.
sudo apt update -y
 

Step 2: Install the apache2 package if it is not already installed. (The dpkg and apt commands are used to check the installation of the packages.)
    Ensure that the apache2 service is running and enabled
    
    
Step 3: Create a tar archive of apache2 access logs and error logs that are present in the /var/log/apache2/ directory and place the tar into the /tmp/ directory. Create a tar of only the .log files (for example access.log) and not any other file type (For example: .zip and .tar) that are already present in the /var/log/apache2/ directory. The name of tar archive should have following format:  <your _name>-httpd-logs-<timestamp>.tar. For example: Ritik-httpd-logs-01212021-101010.tar                                                             Hint : use timestamp=$(date '+%d%m%Y-%H%M%S') )
 
 
step 4: The script should run the AWS CLI command and copy the archive to the s3 bucket. 
    #Hint : use timestamp=$(date '+%d%m%Y-%H%M%S') ) to name  the  tar
    aws s3 \
    cp /tmp/${myname}-httpd-logs-${timestamp}.tar \
    s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar
 
 Step 5: Host the script in Git Repository
 
