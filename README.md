# Installation
Step 1

Login to your Raspberry Pi and clone this repository. The recommended commands are:

    mkdir -p "$HOME/.local"
    git clone https://github.com/ginocic/bash_aliases.git "$HOME/.local/BashAliases"

Step 2

Test the result like this:

    . "$HOME/.local/BashAliases/bash_aliases"

Step 3

To apply bash_aliases each time you login, add this source statement:

    . "$HOME/.local/BashAliases/bash_aliases"

to the following file:

    ~/.bashrc
	
    echo '. "$HOME/.local/BashAliases/bash_aliases"' >> ~/.bashrc

Use the tail command to confirm your editing:

    tail -1 ~/.bashrc

Step 4

Test your work. Do NOT log-out of your existing terminal session. Instead, open a new terminal session.

Worst case is that you will be unable to login to the new terminal session. This is why you should never log-out of an existing terminal session until you are 100% certain that changes made to either .bashrc or .profile are working. If you can't launch a new session, you just use the existing session to track down and nail any bugs. Rinse, repeat.

    This advice goes double if you ever need to edit /etc/profile !!
