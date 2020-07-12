##########################################################################
#
#		Script to add users in Organization Units
#
#	Author: Ícaro César
#	
#	What are you need: archive .cvs when name of users, e-mails,
#	and others proprietes
#
#
##########################################################################


Function Import-(name_of_organization)
    {
    Param (
        [string] $OUName
        )

    $ExportName = "C:\DataFiles\"+$OUName+".csv"
    $Location = "OU="+$OUName+",DC=domain,DC=com"

    New-ADOrganizationalUnit -Name $OUName -Path "DC=domain,DC=com" -ProtectedFromAccidentalDeletion $False

    $LCPassword = "[Default-password]" | ConvertTo-SecureString -AsPlainText -Force

    Import-CSV $ExportName    |
    New-ADUser -Path $Location -AccountPassword $LCPassword -Enabled $TRUE

    }

Import-name_organization -OUName TICSupport
Import-name_organization -OUName E-CorpManagers
Import-name_organization -OUName SalesMarketing
Import-name_organization -OUName RoomService 
