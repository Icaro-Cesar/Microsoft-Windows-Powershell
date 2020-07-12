Function Import-ecorp
    {
    Param (
        [string] $OUName
        )

    $ExportName = "C:\DataFiles\"+$OUName+".csv"
    $Location = "OU="+$OUName+",DC=ecorp,DC=com"

    New-ADOrganizationalUnit -Name $OUName -Path "DC=ecorp,DC=com" -ProtectedFromAccidentalDeletion $False

    $LCPassword = "D3f4u1t@01" | ConvertTo-SecureString -AsPlainText -Force

    Import-CSV $ExportName    |
    New-ADUser -Path $Location -AccountPassword $LCPassword -Enabled $TRUE

    }

Import-ecorp -OUName TICSupport
Import-ecorp -OUName E-CorpManagers
Import-ecorp -OUName SalesMarketing
Import-ecorp -OUName RoomService 
