#This script is to set up linuxbrew
echo "Would you like to install linuxbrew y)es or n)o?"
read answer
#If the answer is not equal to y
if [ $answer != "y" ]
then
  echo "Ok, exiting..."
  #Exit
  exit 0
fi
echo "Downloading and running setup..."
#Download and run the setup
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
echo "Finishing required steps..."
#Finish configuring
PATH="$HOME/.linuxbrew/bin:$PATH"
#If already in .bashrc
if [ $(cat ~/.bashrc | grep 'PATH="$HOME/.linuxbrew/bin:$PATH"') ]
then
  echo ""
else
  echo 'PATH="$HOME/.linuxbrew/bin:$PATH"' >>~/.bashrc
fi
#If the install worked
if [ $(which brew) ]
then
  echo "Linuxbrew is now installed."
  echo "Fixing any issues..."
  #Check for errors
  brew doctor
  echo "Would you like to test linuxbrew y)es or n)o?"
  read test
  #If test is not equal to y
  if [ $test != "y" ]
  then
    echo "Ok. Install finished"
  else
    brew install hello
    if [ $(which hello) ]
    then
      echo "Linuxbrew is functioning properly."
    else
      echo "An error has occured."
    fi
  fi
  echo "Would you like to disable linuxbrew analytics y)es or n)o?"
  read analytics
  if [ $analytics = "y" ]
  then
    brew analytics off
  fi
else
  echo "There was a problem, try running this script again."
  #Exit
  exit 0
fi

