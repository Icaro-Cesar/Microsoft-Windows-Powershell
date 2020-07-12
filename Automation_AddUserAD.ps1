##########################################################################
#
#		Script to add users in Organization Units
#
#	Author: Ícaro César
#	
#	Objective: This script will help you to create your OU and user 
#	structure in your AD. For this, you need a Windows Server with 
#	PowerShell installed, a file made in excel (.cvs) with the names 
#	of users and their e-mails, in addition to other attributes that 
#	you may want.
#	Whenever you have any questions, or anything to add you will be 
#	very welcome! :)
#
###########################################################################


Function Import-(name_of_organization)
    {
    Param (
        [string] $OUName
        )

# Here you'll create two variables with path of the archive .cvs is storage. And the structure of your OUs and domain
    $ExportName = "C:\DataFiles\"+$OUName+".csv"  
    $Location = "OU="+$OUName+",DC=domain,DC=com"

# In this line, you can create a new AD OU. By default the protection from accidental deletion is disable (False)
    New-ADOrganizationalUnit -Name $OUName -Path "DC=domain,DC=com" -ProtectedFromAccidentalDeletion $False

    $LCPassword = "[Default-password]" | ConvertTo-SecureString -AsPlainText -Force

    Import-CSV $ExportName    |
    New-ADUser -Path $Location -AccountPassword $LCPassword -Enabled $TRUE

    }

# Here you'll call the function created and configured above.
Import-name_organization -OUName TICSupport
Import-name_organization -OUName Managers
Import-name_organization -OUName SalesMarketing
Import-name_organization -OUName RoomService 
