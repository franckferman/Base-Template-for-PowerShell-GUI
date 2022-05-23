<#gui-powershell-script-template.ps1
Author: Franck FERMAN - fferman@protonmail.ch
Version: 2.0
Description:
A template to create a graphical interface with PowerShell.
#>

$host.ui.RawUI.WindowTitle = "GUI PowerShell script template - Franck FERMAN"

function Check_AdminRights
{
$is_Admin=(New-Object System.Security.Principal.WindowsPrincipal([System.Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)

switch($is_Admin)
{
    True{Get_mainForm}
    False{Write-Host "Error, please run Powershell in administrator mode." -ForegroundColor red}
    default{Write-Host "Error 520: Unknown Error." -ForegroundColor red}
}
}

function Get_mainForm
{
$WorkingPath=(Get-Location).Path
Set-Location -Path ".\src\images"
$ImagesPath=(Get-Location).Path
Set-Location -Path $WorkingPath

	#Form: Main

Add-Type -AssemblyName System.Windows.Forms    
Add-Type -AssemblyName System.Drawing

$Main=New-Object System.Windows.Forms.Form
$Main.Text="GUI PowerShell script template"
$Main.Size=New-Object System.Drawing.Size(400,600)
$Main.MaximumSize=New-Object System.Drawing.Size(400,600);
$Main.MinimumSize=New-Object System.Drawing.Size(400,600);
$Main.StartPosition="CenterScreen"
$Main.Topmost=$True

$MainIcon=New-Object System.Drawing.Icon ("$ImagesPath\icon.ico")
$Main.Icon=$MainIcon

$MainImage=[System.Drawing.Image]::FromFile("$ImagesPath\bg.jpg")
$Main.BackgroundImage=$MainImage
$Main.BackgroundImageLayout="Center"
# stretch center

	#Banner

$banner=New-Object System.Windows.Forms.Button
$banner.Location=New-Object System.Drawing.Size(80,20)
$banner.Size=New-Object System.Drawing.Size(250,50)

$Main.Controls.Add($banner)
$banner.Add_Click({[console]::beep(500,100)})
$banner.BackColor=[System.Drawing.Color]::FromName("Transparent")

$bannerImage=[System.Drawing.Image]::FromFile("$ImagesPath/banner.png")
$banner.BackgroundImage=$bannerImage
$banner.BackgroundImageLayout="Center"

	#Button: Rename_Computer

$Rename_Computer=New-Object System.Windows.Forms.Button
$Rename_Computer.Location=New-Object System.Drawing.Size(100,100)
$Rename_Computer.Size=New-Object System.Drawing.Size(200,50)
$Rename_Computer.Text="Renaming the computer"

$Main.Controls.Add($Rename_Computer)
$Rename_Computer.BackColor=[System.Drawing.Color]::FromName("Gray")
 
$Rename_Computer.Add_Click({[console]::beep(300,100);Rename_Computer})

function Rename_Computer
{
Write-Host "Ongoing action: Launching Rename_Computer." -ForegroundColor Green
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

	#Main Form - Rename_Computer

$Rename_Computer_Form=New-Object System.Windows.Forms.Form
$Rename_Computer_Form.Text='Rename_Computer - GUI PowerShell script template'
$Rename_Computer_Form.Size=New-Object System.Drawing.Size(335,200)
$Rename_Computer_Form.MaximumSize=New-Object System.Drawing.Size(335,200);
$Rename_Computer_Form.MinimumSize=New-Object System.Drawing.Size(335,200);
$Rename_Computer_Form.StartPosition='CenterScreen'

	#Accept Button - Rename_Computer

$AcceptBtn=New-Object System.Windows.Forms.Button
$AcceptBtn.BackColor=[System.Drawing.Color]::FromName("Gray")
$AcceptBtn.Location=New-Object System.Drawing.Point(85,100)
$AcceptBtn.Size=New-Object System.Drawing.Size(75,25)
$AcceptBtn.Text='Accept'
$AcceptBtn.DialogResult=[System.Windows.Forms.DialogResult]::OK
$Rename_Computer_Form.AcceptButton=$AcceptBtn
$Rename_Computer_Form.Controls.Add($AcceptBtn)

	#Cancel Button - Rename_Computer

$CancelBtn=New-Object System.Windows.Forms.Button
$CancelBtn.BackColor=[System.Drawing.Color]::FromName("Gray")
$CancelBtn.Location=New-Object System.Drawing.Point(170,100)
$CancelBtn.Size=New-Object System.Drawing.Size(75,25)
$CancelBtn.Text='Cancel'
$CancelBtn.DialogResult=[System.Windows.Forms.DialogResult]::Cancel
$Rename_Computer_Form.CancelButton=$CancelBtn
$Rename_Computer_Form.Controls.Add($CancelBtn)

	#Label - Rename_Computer 

$mainLabel=New-Object System.Windows.Forms.Label
$mainLabel.ForeColor=[System.Drawing.Color]::FromName("Gray")
$mainLabel.BackColor=[System.Drawing.Color]::FromName("Transparent")
$mainLabel.Location=New-Object System.Drawing.Point(65,30)
$mainLabel.Size=New-Object System.Drawing.Size(186,20)
$mainLabel.Text='Computer number (example: 15242)'
$Rename_Computer_Form.Controls.Add($mainLabel)

	#TextBox - User Input - Rename_Computer

$mainTb=New-Object System.Windows.Forms.TextBox
$mainTb.Location=New-Object System.Drawing.Point(110,60)
$mainTb.Size=New-Object System.Drawing.Size(100,20)
$Rename_Computer_Form.Controls.Add($mainTb)
$Rename_Computer_Form.Topmost=$true
$Rename_Computer_Form.Add_Shown({$mainTb.Select()})
$Rename_Computer_Form.Icon=$MainIcon

$rcImage=[System.Drawing.Image]::FromFile("$ImagesPath\rc4.jpg")
$Rename_Computer_Form.BackgroundImage=$rcImage
$Rename_Computer_Form.BackgroundImageLayout="Center"
# stretch center

$sd=$Rename_Computer_Form.ShowDialog()
if($sd -eq [System.Windows.Forms.DialogResult]::OK)
{
$i=$mainTb.Text
}
}

	#Button: Example 1

$Example_1=New-Object System.Windows.Forms.Button
$Example_1.Location=New-Object System.Drawing.Size(100,180)
$Example_1.Size=New-Object System.Drawing.Size(200,50)
$Example_1.Text="Example 1"

$Main.Controls.Add($Example_1)
$Example_1.BackColor=[System.Drawing.Color]::FromName("Gray")
 
$Example_1.Add_Click({[console]::beep(300,100);Write-Host "This is an example." -ForegroundColor green})

	#Button: Example 2

$Example_2=New-Object System.Windows.Forms.Button
$Example_2.Location=New-Object System.Drawing.Size(100,260)
$Example_2.Size=New-Object System.Drawing.Size(200,50)
$Example_2.Text="Example 2"

$Main.Controls.Add($Example_2)
$Example_2.BackColor=[System.Drawing.Color]::FromName("Gray")
 
$Example_2.Add_Click({[console]::beep(300,100);Write-Host "This is an example." -ForegroundColor green})

	#Button: Example 3

$Example_3=New-Object System.Windows.Forms.Button
$Example_3.Location=New-Object System.Drawing.Size(100,340)
$Example_3.Size=New-Object System.Drawing.Size(200,50)
$Example_3.Text="Example 3"

$Main.Controls.Add($Example_3)
$Example_3.BackColor=[System.Drawing.Color]::FromName("Gray")
 
$Example_3.Add_Click({[console]::beep(300,100);Write-Host "This is an example." -ForegroundColor green})

	#Button: Redirect to a website.

$Website_Redirect=New-Object System.Windows.Forms.Button
$Website_Redirect.Location=New-Object System.Drawing.Size(100,420)
$Website_Redirect.Size=New-Object System.Drawing.Size(200,50)
$Website_Redirect.Text="Redirect to a website"

$Main.Controls.Add($Website_Redirect)
$Website_Redirect.BackColor=[System.Drawing.Color]::FromName("Gray")
 
$Website_Redirect.Add_Click({[console]::beep(300,100);Write-Host "Redirection to my Github profile." -ForegroundColor green;Start-Process -WindowStyle Maximized "https://github.com/franckferman"})

	#Button: About

$about=New-Object System.Windows.Forms.Button
$about.Location=New-Object System.Drawing.Size(100,500)
$about.Size=New-Object System.Drawing.Size(50,50)

$about.Add_Click({
Start-Process -File '.\src\etc\fs0ci3ty.mp3' -WindowStyle Minimized
Write-Host "Info: Script created by Franck FERMAN (fferman@protonmail.ch)." -ForegroundColor green
[System.Windows.Forms.MessageBox]::Show("Script created by Franck FERMAN (fferman@protonmail.ch)","Base Template for PowerShell GUI",0,[System.Windows.Forms.MessageBoxIcon]::Information)
})

$Main.Controls.Add($about)
$about.BackColor=[System.Drawing.Color]::FromName("Transarent")

$aboutImage=[System.Drawing.Image]::FromFile("$ImagesPath/about.png")
$about.BackgroundImage=$aboutImage
$about.BackgroundImageLayout="Stretch"

	#Button: Quit

$quit=New-Object System.Windows.Forms.Button
$quit.Location=New-Object System.Drawing.Size(250,500)
$quit.Size=New-Object System.Drawing.Size(50,50)

$quit.DialogResult=[System.Windows.Forms.DialogResult]::Cancel
$Main.Controls.Add($quit)
$quit.BackColor=[System.Drawing.Color]::FromName("Transarent")

$quitImage=[System.Drawing.Image]::FromFile("$ImagesPath/quit.png")
$quit.BackgroundImage=$quitImage
$quit.BackgroundImageLayout="Stretch"

$Main.ShowDialog()|Out-Null
}

Check_AdminRights
# SIG # Begin signature block
# MIIZfgYJKoZIhvcNAQcCoIIZbzCCGWsCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUSgvNLm1goWpARUuMDfPUICZP
# jwigghOSMIIFkzCCBHugAwIBAgITTQAAABkdsBkxWWfEPAAAAAAAGTANBgkqhkiG
# 9w0BAQsFADBOMRUwEwYKCZImiZPyLGQBGRYFbG9jYWwxFjAUBgoJkiaJk/IsZAEZ
# FgZhdWxuYXkxHTAbBgNVBAMTFGF1bG5heS1QS0ktQVBQLVdQLUNBMB4XDTIyMDIy
# ODA4Mjc0OFoXDTIzMDIyODA4Mjc0OFowGDEWMBQGA1UEAxMNRkVSTUFOIEZyYW5j
# azCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKw566ga9BudRr/YZ2dE
# eMaQlrDBl8twqh/t2UhOJwB6M9La1fKgI2d/cKPNOr09WQrBdvh/XLIB2MW4ifVI
# 4U93Xp/X6zjxua1fatZy0rAJqYEDtSdUZz5O/ir3OZpLyPMa/JDlL62kWCze1wcF
# I65cBr/CkOaP6rJPKQN+X9BDXyBN0If9oUrQ7jCtbLf12FQ6PefYUantGkwAS8qr
# 2vg5KEjxeDrFRnPi/z5InvZHrF5IrZlk2LzfBb59nI2Yl3RxSYnZzFPVeFcfSUIa
# WDd60ZQlPkJPArHSkrNW1rF+SsOZAJta7x42074VgFNah6MA/PlUW0U0CP71YJ8z
# SeECAwEAAaOCAp4wggKaMD4GCSsGAQQBgjcVBwQxMC8GJysGAQQBgjcVCIWfoF2F
# 6qg7g4WRH4X7zByC77crgXGC2cMKh5C7cQIBZAIBBTATBgNVHSUEDDAKBggrBgEF
# BQcDAzALBgNVHQ8EBAMCB4AwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDAzAd
# BgNVHQ4EFgQUQjLfr3K4jmhVTRs2myIJkizIOdUwHwYDVR0jBBgwFoAUf2loKHIU
# zCWuoFOAzLgb9GQgWNYwgdYGA1UdHwSBzjCByzCByKCBxaCBwoaBv2xkYXA6Ly8v
# Q049YXVsbmF5LVBLSS1BUFAtV1AtQ0EsQ049UEtJLUFQUC1XUCxDTj1DRFAsQ049
# UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJh
# dGlvbixEQz1hdWxuYXksREM9bG9jYWw/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlz
# dD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50MIHHBggrBgEF
# BQcBAQSBujCBtzCBtAYIKwYBBQUHMAKGgadsZGFwOi8vL0NOPWF1bG5heS1QS0kt
# QVBQLVdQLUNBLENOPUFJQSxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1T
# ZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPWF1bG5heSxEQz1sb2NhbD9jQUNl
# cnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0
# eTA2BgNVHREELzAtoCsGCisGAQQBgjcUAgOgHQwbRkZlcm1hbkBhdWxuYXktc291
# cy1ib2lzLmZyMA0GCSqGSIb3DQEBCwUAA4IBAQAq9k/6Y8EAcGyH41eZItWJQbxa
# MQ7o/2XZ6tbQPivw1fEZLfj4g183qXso6PR3pvHToFLo1qai3vWA5Gx1cxyjEIom
# yWQ2wisEUNVc6DiSWBZExPSHJZGVuYu4ZSiUFIwZtnMcZmVenbblV2JL7y5N6SrG
# bnGq+U+iGVCOTQfDUGYUGVvTiuFRe6iv+qDEv+SkBPptwt5LfadqFDpTKHz0RQ0I
# +4TUp7Tgg9FuRmw1uH0jWhSba0grSFp/67hygx7FscWldGTexISV47dVFmEs0i8P
# P7SStTcejOS+ga6yKiMFCLFGqgSYUrVTmgpRmBEqa5Z8hZKcvuoo0dL8YwmQMIIG
# 7DCCBNSgAwIBAgIQMA9vrN1mmHR8qUY2p3gtuTANBgkqhkiG9w0BAQwFADCBiDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNl
# eSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMT
# JVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTkwNTAy
# MDAwMDAwWhcNMzgwMTE4MjM1OTU5WjB9MQswCQYDVQQGEwJHQjEbMBkGA1UECBMS
# R3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9T
# ZWN0aWdvIExpbWl0ZWQxJTAjBgNVBAMTHFNlY3RpZ28gUlNBIFRpbWUgU3RhbXBp
# bmcgQ0EwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDIGwGv2Sx+iJl9
# AZg/IJC9nIAhVJO5z6A+U++zWsB21hoEpc5Hg7XrxMxJNMvzRWW5+adkFiYJ+9Uy
# UnkuyWPCE5u2hj8BBZJmbyGr1XEQeYf0RirNxFrJ29ddSU1yVg/cyeNTmDoqHvzO
# WEnTv/M5u7mkI0Ks0BXDf56iXNc48RaycNOjxN+zxXKsLgp3/A2UUrf8H5VzJD0B
# KLwPDU+zkQGObp0ndVXRFzs0IXuXAZSvf4DP0REKV4TJf1bgvUacgr6Unb+0ILBg
# frhN9Q0/29DqhYyKVnHRLZRMyIw80xSinL0m/9NTIMdgaZtYClT0Bef9Maz5yIUX
# x7gpGaQpL0bj3duRX58/Nj4OMGcrRrc1r5a+2kxgzKi7nw0U1BjEMJh0giHPYla1
# IXMSHv2qyghYh3ekFesZVf/QOVQtJu5FGjpvzdeE8NfwKMVPZIMC1Pvi3vG8Aij0
# bdonigbSlofe6GsO8Ft96XZpkyAcSpcsdxkrk5WYnJee647BeFbGRCXfBhKaBi2f
# A179g6JTZ8qx+o2hZMmIklnLqEbAyfKm/31X2xJ2+opBJNQb/HKlFKLUrUMcpEmL
# QTkUAx4p+hulIq6lw02C0I3aa7fb9xhAV3PwcaP7Sn1FNsH3jYL6uckNU4B9+rY5
# WDLvbxhQiddPnTO9GrWdod6VQXqngwIDAQABo4IBWjCCAVYwHwYDVR0jBBgwFoAU
# U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFBqh+GEZIA/DQXdFKI7RNV8G
# EgRVMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBMGA1UdJQQM
# MAoGCCsGAQUFBwMIMBEGA1UdIAQKMAgwBgYEVR0gADBQBgNVHR8ESTBHMEWgQ6BB
# hj9odHRwOi8vY3JsLnVzZXJ0cnVzdC5jb20vVVNFUlRydXN0UlNBQ2VydGlmaWNh
# dGlvbkF1dGhvcml0eS5jcmwwdgYIKwYBBQUHAQEEajBoMD8GCCsGAQUFBzAChjNo
# dHRwOi8vY3J0LnVzZXJ0cnVzdC5jb20vVVNFUlRydXN0UlNBQWRkVHJ1c3RDQS5j
# cnQwJQYIKwYBBQUHMAGGGWh0dHA6Ly9vY3NwLnVzZXJ0cnVzdC5jb20wDQYJKoZI
# hvcNAQEMBQADggIBAG1UgaUzXRbhtVOBkXXfA3oyCy0lhBGysNsqfSoF9bw7J/Ra
# oLlJWZApbGHLtVDb4n35nwDvQMOt0+LkVvlYQc/xQuUQff+wdB+PxlwJ+TNe6qAc
# Jlhc87QRD9XVw+K81Vh4v0h24URnbY+wQxAPjeT5OGK/EwHFhaNMxcyyUzCVpNb0
# llYIuM1cfwGWvnJSajtCN3wWeDmTk5SbsdyybUFtZ83Jb5A9f0VywRsj1sJVhGbk
# s8VmBvbz1kteraMrQoohkv6ob1olcGKBc2NeoLvY3NdK0z2vgwY4Eh0khy3k/ALW
# PncEvAQ2ted3y5wujSMYuaPCRx3wXdahc1cFaJqnyTdlHb7qvNhCg0MFpYumCf/R
# oZSmTqo9CfUFbLfSZFrYKiLCS53xOV5M3kg9mzSWmglfjv33sVKRzj+J9hyhtal1
# H3G/W0NdZT1QgW6r8NDT/LKzH7aZlib0PHmLXGTMze4nmuWgwAxyh8FuTVrTHurw
# ROYybxzrF06Uw3hlIDsPQaof6aFBnf6xuKBlKjTg3qj5PObBMLvAoGMs/FwWAKjQ
# xH/qEZ0eBsambTJdtDgJK0kHqv3sMNrxpy/Pt/360KOE2See+wFmd7lWEOEgbsau
# sfm2usg1XTN2jvF8IAwqd661ogKGuinutFoAsYyr4/kKyVRd1LlqdJ69SK6YMIIH
# BzCCBO+gAwIBAgIRAIx3oACP9NGwxj2fOkiDjWswDQYJKoZIhvcNAQEMBQAwfTEL
# MAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
# BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSUwIwYDVQQDExxT
# ZWN0aWdvIFJTQSBUaW1lIFN0YW1waW5nIENBMB4XDTIwMTAyMzAwMDAwMFoXDTMy
# MDEyMjIzNTk1OVowgYQxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1h
# bmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
# aXRlZDEsMCoGA1UEAwwjU2VjdGlnbyBSU0EgVGltZSBTdGFtcGluZyBTaWduZXIg
# IzIwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCRh0ssi8HxHqCe0wfG
# AcpSsL55eV0JZgYtLzV9u8D7J9pCalkbJUzq70DWmn4yyGqBfbRcPlYQgTU6IjaM
# +/ggKYesdNAbYrw/ZIcCX+/FgO8GHNxeTpOHuJreTAdOhcxwxQ177MPZ45fpyxnb
# VkVs7ksgbMk+bP3wm/Eo+JGZqvxawZqCIDq37+fWuCVJwjkbh4E5y8O3Os2fUAQf
# GpmkgAJNHQWoVdNtUoCD5m5IpV/BiVhgiu/xrM2HYxiOdMuEh0FpY4G89h+qfNfB
# Qc6tq3aLIIDULZUHjcf1CxcemuXWmWlRx06mnSlv53mTDTJjU67MximKIMFgxvIC
# LMT5yCLf+SeCoYNRwrzJghohhLKXvNSvRByWgiKVKoVUrvH9Pkl0dPyOrj+lcvTD
# WgGqUKWLdpUbZuvv2t+ULtka60wnfUwF9/gjXcRXyCYFevyBI19UCTgqYtWqyt/t
# z1OrH/ZEnNWZWcVWZFv3jlIPZvyYP0QGE2Ru6eEVYFClsezPuOjJC77FhPfdCp3a
# vClsPVbtv3hntlvIXhQcua+ELXei9zmVN29OfxzGPATWMcV+7z3oUX5xrSR0Gyzc
# +Xyq78J2SWhi1Yv1A9++fY4PNnVGW5N2xIPugr4srjcS8bxWw+StQ8O3ZpZelDL6
# oPariVD6zqDzCIEa0USnzPe4MQIDAQABo4IBeDCCAXQwHwYDVR0jBBgwFoAUGqH4
# YRkgD8NBd0UojtE1XwYSBFUwHQYDVR0OBBYEFGl1N3u7nTVCTr9X05rbnwHRrt7Q
# MA4GA1UdDwEB/wQEAwIGwDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsG
# AQUFBwMIMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQMIMCUwIwYIKwYBBQUHAgEW
# F2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMEQGA1UdHwQ9MDswOaA3oDWGM2h0dHA6
# Ly9jcmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQVRpbWVTdGFtcGluZ0NBLmNybDB0
# BggrBgEFBQcBAQRoMGYwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQuc2VjdGlnby5j
# b20vU2VjdGlnb1JTQVRpbWVTdGFtcGluZ0NBLmNydDAjBggrBgEFBQcwAYYXaHR0
# cDovL29jc3Auc2VjdGlnby5jb20wDQYJKoZIhvcNAQEMBQADggIBAEoDeJBCM+x7
# GoMJNjOYVbudQAYwa0Vq8ZQOGVD/WyVeO+E5xFu66ZWQNze93/tk7OWCt5XMV1Vw
# S070qIfdIoWmV7u4ISfUoCoxlIoHIZ6Kvaca9QIVy0RQmYzsProDd6aCApDCLpOp
# viE0dWO54C0PzwE3y42i+rhamq6hep4TkxlVjwmQLt/qiBcW62nW4SW9RQiXgNdU
# IChPynuzs6XSALBgNGXE48XDpeS6hap6adt1pD55aJo2i0OuNtRhcjwOhWINoF5w
# 22QvAcfBoccklKOyPG6yXqLQ+qjRuCUcFubA1X9oGsRlKTUqLYi86q501oLnwIi4
# 4U948FzKwEBcwp/VMhws2jysNvcGUpqjQDAXsCkWmcmqt4hJ9+gLJTO1P22vn18K
# Vt8SscPuzpF36CAT6Vwkx+pEC0rmE4QcTesNtbiGoDCni6GftCzMwBYjyZHlQgNL
# gM7kTeYqAT7AXoWgJKEXQNXb2+eYEKTx6hkbgFT6R4nomIGpdcAO39BolHmhoJ6O
# trdCZsvZ2WsvTdjePjIeIOTsnE1CjZ3HM5mCN0TUJikmQI54L7nu+i/x8Y/+ULh4
# 3RSW3hwOcLAqhWqxbGjpKuQQK24h/dN8nTfkKgbWw/HXaONPB3mBCBP+smRe6bE8
# 5tB4I7IJLOImYr87qZdRzMdEMoGyr8/fMYIFVjCCBVICAQEwZTBOMRUwEwYKCZIm
# iZPyLGQBGRYFbG9jYWwxFjAUBgoJkiaJk/IsZAEZFgZhdWxuYXkxHTAbBgNVBAMT
# FGF1bG5heS1QS0ktQVBQLVdQLUNBAhNNAAAAGR2wGTFZZ8Q8AAAAAAAZMAkGBSsO
# AwIaBQCgeDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3DQEJAzEM
# BgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEVMCMGCSqG
# SIb3DQEJBDEWBBRIh0OI5Xh+OdWmmVPmzRxivfK1QjANBgkqhkiG9w0BAQEFAASC
# AQBmbPPhP4tXOv0qpzhEc2o22KEyMNWfQo87MVEPVXjdq9mwwWWPYLuVQ87/1OqO
# yR19LFEZwHAQgXcdWXjv5sGte4YzRDTln6uvQkPlpJNRUbdVLNvLQdheqmUfh1YV
# NBAYe2nWzq/YSEbGW7TJSTDHNc5MLYIfKYCw5pQwiozneBuYHKBPRJV7EVfTOGu3
# kvlO6rrbLh329JAkLbAsnpMIoYLJKpU5srYmSsjjz6bD5aEDsHTlhKHgaqms/fmr
# GzEyyYeWH1ddo7UoIxamnV1Fc9JL9fTawaCdn2N9F0M9w/5YbsnzyTlEeMXVSK4H
# my2HuQwXpIg+uLWlelMmqg83oYIDTDCCA0gGCSqGSIb3DQEJBjGCAzkwggM1AgEB
# MIGSMH0xCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIx
# EDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDElMCMG
# A1UEAxMcU2VjdGlnbyBSU0EgVGltZSBTdGFtcGluZyBDQQIRAIx3oACP9NGwxj2f
# OkiDjWswDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
# MBwGCSqGSIb3DQEJBTEPFw0yMjAyMjgwOTM2NDlaMD8GCSqGSIb3DQEJBDEyBDD6
# G586DNJLQM9mrVsoh1+utsaNzsMZVDZoUG+dSPfyHsZ+615/1J2jZ58nSvxk1igw
# DQYJKoZIhvcNAQEBBQAEggIALtgNMu5E7PxO6m0n1E8nX5HfRDTRvZDHeQ2y3awQ
# 1cR1wJyR/5sk7nzDJpVj4x9FH/hFx9+CUQURZZh0+pKOUWKi/xioC0OsjUDcuhZG
# aAgfNMpq/JrZGadI+HiTjNDMG22BZ/x5n/3lUk4MbsEyMJ1AY4fonWu3nX4FX2ZV
# yj7yj9coYzYo7GqpZicG/3Ug0NHDN1LP9NIhRGzZXc2W0A0dKzKNIvpFYZSuJAzq
# GJ7PY9dLNUer8xn4PGrAiQgMJFdQAAxZ2IYwMLW8jubCtmbtlA7mX8AHZqy2NM3p
# 2h+TmrspKcO9YLGn8K0XEvnT6UU14PfdLrW2NRucfepGD0uAnUxfWFtajRCvqGcc
# HYcj5B5VDr7bSKXxBhIyqRmPW9+45tfAXIt8eGLAiSA4LR5jKI4/5yEQZPLACHRn
# yZ+zbMjmEhZHXhFfPG8IxM2RKWZvImuut7g8NwvxS+CXbK7NCM4O3HDVcduzBBDg
# 9YpHHC903gh/M41IVHcsw+jA+/nEgN10d4XJ1kO3KT9I+1d/T1O1NFdubCJ48c46
# uFmE3/532OoIX+ptGviI0thBwODwnbKnUxWIPFFN3+VhwGa17V6jAHoS/jidDvR0
# e1ER4BJAAZ4QCaoI1dWXcqRy+V8LjUoax9GxQl47+UwOLuY2Tj4M3o0Le2JwfDmF
# FyQ=
# SIG # End signature block
