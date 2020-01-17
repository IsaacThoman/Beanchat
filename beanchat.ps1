Add-Type -AssemblyName System.Windows.Forms
$Label1                          = New-Object system.Windows.Forms.Label
function startTimer() { 

   $timer.start()

}
function refreshtext {

# create a new pipeline  
$getData = [powershell]::create()  
# add a command (returns Command object)  
[void] $getData.AddScript("C:/beanchat/recieve.bat")  


$getData.Invoke()
$recentmessages1 = (gc C:\beanchat\chat.txt | select-object -last 16) | Out-String
$Label1.text                     = "$recentmessages1"

# clean up  
$getData.dispose() 

}

#$beanusername = "gamer"
# a test comment
[System.Windows.Forms.Application]::EnableVisualStyles()
function loadnewmessages {
C:/beanchat/recieve.bat
$recentmessages = (gc C:\beanchat\chat.txt | select-object -last 16) | Out-String
$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '400,400'
$Form.text                       = "Beanchat"
$Form.TopMost                    = $false
$Form.StartPosition = "1"

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "egg"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(8,65)
$Label1.Font                     = 'Microsoft Sans Serif,10'



}
function usernameform {
$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '400,400'
$Form.text                       = "Beanchat"
$Form.TopMost                    = $false
$Form.StartPosition = "1"
$setusernamelabel                = New-Object system.Windows.Forms.Label
$setusernamelabel.text           = "Set username"
$setusernamelabel.AutoSize       = $true
$setusernamelabel.width          = 25
$setusernamelabel.height         = 10
$setusernamelabel.location       = New-Object System.Drawing.Point(140,26)
$setusernamelabel.Font           = 'Microsoft Sans Serif,10'

$usernamebutton                  = New-Object system.Windows.Forms.Button
$usernamebutton.text             = "confirm"
$usernamebutton.width            = 60
$usernamebutton.height           = 30
$usernamebutton.location         = New-Object System.Drawing.Point(150,80)
$usernamebutton.Font             = 'Microsoft Sans Serif,10'

$usernamebox                     = New-Object system.Windows.Forms.TextBox
$usernamebox.multiline           = $false
$usernamebox.width               = 100
$usernamebox.height              = 20
$usernamebox.location            = New-Object System.Drawing.Point(130,50)
$usernamebox.Font                = 'Microsoft Sans Serif,10'
$Form.controls.AddRange(@($setusernamelabel,$usernamebutton,$usernamebox))
$usernamebutton.Add_Click({
 $Env:beanchatusername = $usernamebox.Text

 $Form.Close()

})
[void]$Form.ShowDialog()
 refresh | Out-Null
}

function checkusername {


}
function refresh {


C:/beanchat/getmotd.bat
loadnewmessages
C:/beanchat/recieve.bat
$recentmessages = (gc C:\beanchat\chat.txt | select-object -last 16) | Out-String
$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '400,400'
$Form.text                       = "Beanchat"
$Form.TopMost                    = $false
$Form.StartPosition = "1"
$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $true
$TextBox1.width                  = 316
$TextBox1.height                 = 65
$TextBox1.location               = New-Object System.Drawing.Point(9,324)
$TextBox1.Font                   = 'Microsoft Sans Serif,10'


$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "$recentmessages"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 0
$Label1.location                 = New-Object System.Drawing.Point(8,75)
$Label1.Font                     = 'Microsoft Sans Serif,10'
#AUTO REFRESH CODE------------------------------------------------------------------------------------------------------


 $timer = New-Object System.Windows.Forms.Timer
  $timer.Interval = 5000
  $timer.add_tick({
  refreshtext
  })



$refreshbutton                   = New-Object system.Windows.Forms.Button
$refreshbutton.text              = "refresh"
$refreshbutton.width             = 60
$refreshbutton.height            = 30
$refreshbutton.location          = New-Object System.Drawing.Point(329,359)
$refreshbutton.Font              = 'Microsoft Sans Serif,10'

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Send"
$Button1.width                   = 60
$Button1.height                  = 30
$Button1.location                = New-Object System.Drawing.Point(329,324)
$Button1.Font                    = 'Microsoft Sans Serif,10'

$resetbutton                         = New-Object system.Windows.Forms.Button
$resetbutton.text                    = "reset"
$resetbutton.width                   = 60
$resetbutton.height                  = 30
$resetbutton.location                = New-Object System.Drawing.Point(270,17)
$resetbutton.Font                    = 'Microsoft Sans Serif,10'


$header                          = New-Object system.Windows.Forms.PictureBox
$header.width                    = 200
$header.height                   = 75
$header.location                 = New-Object System.Drawing.Point(0,0)
$header.imageLocation            = "https://cdn.beanchat.tk/header.png"
$header.SizeMode                 = [System.Windows.Forms.PictureBoxSizeMode]::zoom
#made by isaac thoman
$lenny                     = New-Object system.Windows.Forms.PictureBox
$lenny.width               = 400
$lenny.height              = 193
$lenny.location            = New-Object System.Drawing.Point(0,430)
$lenny.imageLocation       = "https://cdn.beanchat.tk/footer.png"
$lenny.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$settingsbutton                  = New-Object system.Windows.Forms.Button
$settingsbutton.text             = "Settings"
$settingsbutton.width            = 65
$settingsbutton.height           = 30
$settingsbutton.location         = New-Object System.Drawing.Point(200,17)
$settingsbutton.Font             = 'Microsoft Sans Serif,10'


$autorefresh                          = New-Object system.Windows.Forms.Label
$autorefresh.text                     = ""
$autorefresh.AutoSize                 = $true
$autorefresh.width                    = 25
$autorefresh.height                   = 0
$autorefresh.location                 = New-Object System.Drawing.Point(8,75)
$autorefresh.Font                     = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($TextBox1,$Label1,$refreshbutton,$Button1,$header,$lenny,$settingsbutton,$resetbutton,$autorefresh))

$refreshbutton.Add_Click({ 
refreshtext
})

$resetbutton.Add_Click({ $Form.Hide()
refresh })
$Button1.Add_Click({
send })
$settingsbutton.Add_Click({ 
#$Form.Hide()
settings })


StartTimer;
$Form.Hide()
[void]$Form.ShowDialog()



}
function scrollup($scrollammount) {
C:/beanchat/recieve.bat
$stream = [IO.File]::OpenWrite('C:\beanchat\chat.txt')
$stream.SetLength($stream.Length - $scrollammount)
$stream.Close()
$stream.Dispose()
$recentmessages1 = (gc C:\beanchat\chat.txt | select-object -last 16) | Out-String
#$Label1.text                     = "$recentmessages1"

}


function send {
$textboxcontents = $TextBox1.Text
$afterusername = ": "
$messagetosend = "$Env:beanchatusername$afterusername$textboxcontents"
#$messagetosend = "$textboxcontents"
C:/beanchat/recieve.bat
$oldmessage = (gc C:\beanchat\chat.txt | select-object -last 40) | Out-String
$path = "C:\beanchat\chat.txt"
$outputfile = "$oldmessage$messagetosend"
$outputfile | Out-File $path
C:/beanchat/send.bat
$recentmessages1 = (gc C:\beanchat\chat.txt | select-object -last 16) | Out-String
$Label1.text                     = "$recentmessages1"
$TextBox1.Text = ""
}

function leave {
$leavemessage = " has left the chat."
$messagetosend = "$Env:beanchatusername$leavemessage"
C:/beanchat/recieve.bat
$oldmessage = (gc C:\beanchat\chat.txt | select-object -last 40) | Out-String
$path = "C:\beanchat\chat.txt"
$outputfile = "$oldmessage$messagetosend"
$outputfile | Out-File $path
C:/beanchat/send.bat
}

function join {
$leavemessage = " has joined the chat."
$messagetosend = "$Env:beanchatusername$leavemessage"
C:/beanchat/recieve.bat
$oldmessage = (gc C:\beanchat\chat.txt | select-object -last 40) | Out-String
$path = "C:\beanchat\chat.txt"
$outputfile = "$oldmessage$messagetosend"
$outputfile | Out-File $path
C:/beanchat/send.bat
}

#settings
function settings {

$motdmessage = (gc C:\beanchat\motd.txt | select-object -last 5) | Out-String


#$Form                            = New-Object system.Windows.Forms.Form
#$Form.ClientSize                 = '400,400'
#$Form.text                       = "Beanchat - Settings"
#$Form.TopMost                    = $false
#$Form.StartPosition = "1"

$settingsbackbutton                  = New-Object system.Windows.Forms.Button
$settingsbackbutton.text             = "Back"
$settingsbackbutton.width            = 60
$settingsbackbutton.height           = 30
$settingsbackbutton.location         = New-Object System.Drawing.Point(10,10)
$settingsbackbutton.Font             = 'Microsoft Sans Serif,10'

$updatebutton                  = New-Object system.Windows.Forms.Button
$updatebutton.text             = "Update"
$updatebutton.width            = 60
$updatebutton.height           = 30
$updatebutton.location         = New-Object System.Drawing.Point(10,45)
$updatebutton.Font             = 'Microsoft Sans Serif,10'

$websitebutton                  = New-Object system.Windows.Forms.Button
$websitebutton.text             = "website"
$websitebutton.width            = 60
$websitebutton.height           = 30
$websitebutton.location         = New-Object System.Drawing.Point(10,80)
$websitebutton.Font             = 'Microsoft Sans Serif,10'

$refreshbox                       = New-Object system.Windows.Forms.CheckBox
$refreshbox.text                  = "checkBox"
$refreshbox.AutoSize              = $false
$refreshbox.width                 = 95
$refreshbox.location              = New-Object System.Drawing.Point(12,75)
$refreshbox.Font                  = 'Microsoft Sans Serif,10'

$motd                            = New-Object system.Windows.Forms.Label
$motd.text                       = "$motdmessage"
$motd.AutoSize                   = $true
$motd.width                      = 25
$motd.height                     = 10
$motd.location                   = New-Object System.Drawing.Point(2,370)
$motd.Font                       = 'Microsoft Sans Serif,10'
$Form.controls.Clear()
$Form.controls.AddRange(@($settingsbackbutton,$motd,$updatebutton))
#BACK BUTTON CODE GOES HERE! -----------------------------------------------------------------------------------------------------------------
$settingsbackbutton.Add_Click({ 
$Form.controls.Clear()

$Form.controls.AddRange(@($TextBox1,$Label1,$refreshbutton,$Button1,$header,$lenny,$settingsbutton,$resetbutton))

C:/beanchat/recieve.bat
$recentmessages1 = (gc C:\beanchat\chat.txt | select-object -last 16) | Out-String
$Label1.text                     = "$recentmessages1"
})



$updatebutton.Add_Click({ 

update

})
$websitebutton.Add_Click({ 
start "http://beanchat.tk"

})
#[void]$Form.ShowDialog()

}

function update {

start-process "C:/beaninst/beanchatupdate.exe"
sleep 1
$Form.Hide()
}




          usernameform | Out-Null
         




