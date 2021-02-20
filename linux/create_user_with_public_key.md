# Create new user, to use a public key


- create a new user
- give that user sudo privileges
- test that the new user can use sudo privileges.
- test that the new user can connect through SSH.



## create a new user

	useradd fred

and set password:

	password fred


## give that user sudo privileges

Add a user to the sudo group with:

	gpasswd -a fred sudo

(here's another way... `usermod -aG sudo fred` ...?)


You must be root or have sudo privileges in order to do this.

## test that the new user can use sudo privileges

use `su` (switch user) to switch to the new user...

	su - fred

(you will need to use their password to do this)

Try and do this... (it shouldn't let you...)

	ls -la /root

Now sudo do it!

	sudo ls -la /root

(and enter fred's password...)


## test that the new user can connect through SSH

	//TODO:

## sources

- [add users in linux](https://www.tecmint.com/add-users-in-linux)
- [How To Create a Sudo User on Ubuntu [Quickstart]](https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-ubuntu-quickstart)
- [How To Create a New Sudo-enabled User on Ubuntu 18.04 [Quickstart]](https://www.digitalocean.com/community/tutorials/how-to-create-a-new-sudo-enabled-user-on-ubuntu-18-04-quickstart)

