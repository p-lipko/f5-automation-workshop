# Task 1.1 - Explore and start the lab environment for UDF users

```
Note:
Non-UDF users can skip this section ans go straight to task1.2 which is about peparing Postman*
```

**Step 1:** From UDF, start an RDP session to the Jumphost. For modern laptops it might be a suggestion to use the 1440x900 resolution to keep things readable in the remote session.

![](../png/module1/task1_1_p1.png)

    
**Step 2:** In the Remote Desktop Connection popup select **‘Connect’**. Ignore the warning that the identity could not be verified and click **‘Yes’**.

**Step 3:** Login to Ubuntu with ``f5student/f5student123``.

![](../png/module1/task1_1_p2.png)

**Step 4:** Ignore any authentication pop-up by pressing **Cancel**.

**Step 5:** At the desktop, select **‘Activities’** in the upper left corner and select ![](../png/module1/task1_1_p3.png)

from the menu on the left. This will start Visual Studio Code.

**Step 6:** When no Terminal is shown, go to ‘Terminal’ and select **‘new Terminal’**.
 
![](../png/module1/task1_1_p4.png)

This will open a Terminal window in the lower section of VSC.

**Step 7:** In this terminal, which is bash based type:

**git clone https://github.com/gwolfis/cloud-automation-workshop.git**

This grabs the files we will going to use for the lab from Github and places them on the Jumphost.

![](../png/module1/task1_1_p5.png)

```
Note for F5-ers:
At this point refresh the Azure credentials which can be found at /file/tmp.yml. When you don't know how to setup an Azure AD app registration and assign a role to it, please check the section 'Task1_0'.

Non-F5 but invited students using UDF should not worry, this is arranged for you.
```

**Step 8:** Let’s open the folder in VSC, by selecting ![](../png/module1/task1_1_p6.png)

in the left pane and in the Home directory select **‘cloud-automation-workshop’** and click **‘OK’**.

![](../png/module1/task1_1_p7.png)

Expand the folder by selecting **'CLOUD-AUTOMATION-WORKSHOP'** and than select **'failover-via-api'**.

The folder contains all the files to fire up the infrastructure in Azure public cloud by using terraform.

![](../png/module1/task1_1_p8.png)


This workshop is built by using HashiCorp Terraform (https://www.terraform.io/) which is an open-source infrastructure as code software tool. Having a basic understanding how Terraform works will be beneficial for this course to better understand the taken steps, but if you don't have this knowledge, following the steps will get you through. Just take your time to understand what is happening.

**Step 9:** In the terminal section, be sure you are in the directory ``cloud-automation-workshop`` and type the following and press enter:

**cd failover-via-api/payg/3-nic-basic-deployment/**

and

**cp setup_changeme.yml setup.yml**

**Step 10:** Select **‘setup.yml’** and in the file select **<student_number>** and right-click and select **‘Copy’**.

![](../png/module1/task1_1_p9.png)

**Step 11:** Type **‘Ctrl+H’** to search and replace the label into your actual student number. This has been assigned to you when being in the workshop. The picture shows ‘100’, but this **'most'** be your assigned student number! And click to replace it either at once or piece by piece to understand what you are replacing.

**Step 12:** As a result, you should see that everywhere the label **<student_number>** is replaced by **‘<your_assigned_student_number>’**. This counts for the student_number, and all B-octets of defined IP ranges and IP host addresses.

**Step 13:** Don't forget to **'CHANGE'** the user_password into a strong password like eg. 'F5emea2022!' or a strong random password and make sure yhou store it somwhere.

**Step 14:** Close the search and replace window and save the changes by pressing **‘Ctrl+S’**. Not saving the changes will make terraform fail!

**Step 15:** In the terminal type: **terraform init**
 
![](../png/module1/task1_1_p10.png)

You should see this output.

**Step 16:** Next, type: **terraform plan**

**Step 17:** Finally type: **terraform apply -auto-approve**

Terraform will take about ~10min to deploy the infrastructure. Time for coffee!
* After ~3 minutes you will see underneath output.
* After ~10 minutes the BIG-IPs are up and clustered.

After the 3 minutes you can login, but don't touch anything, otherwise you will disrupt the deployment process.

![](../png/module1/task1_1_p11.png)

When all is deployed, you should see this output.

```
Note: 
Public IPs will be different
```