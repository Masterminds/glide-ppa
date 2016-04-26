# glide-ppa
## Prerequisites
### First of all, you need a ubuntu box. You can get one, for example, with vagrant  
`vagrant init ubuntu/trusty64; vagrant up --provider virtualbox`  

Then

1. Generate a **gpg key** following these [instructions](https://gist.github.com/franciscocpg/1575d286548034113884c3185ca88681)
2. List the generated key

 ```
gpg --list-keys
/home/ubuntu/.gnupg/pubring.gpg
-------------------------------
pub   2048R/89E37042 2016-04-26
uid                  Test <test@test.com>
sub   2048R/92C63808 2016-04-26
```
3. Send key to ubuntu keyserver based on the **pub** id, for the given example

 ```
gpg --send-keys --key hkp://keyserver.ubuntu.com 89E37042
```
4. Get your key fingerprint

 ```
gpg --fingerprint
/home/ubuntu/.gnupg/pubring.gpg
-------------------------------
pub   2048R/89E37042 2016-04-26
      Key fingerprint = EB6E ABC8 39B2 DF55 C031  44D5 FBA1 8466 89E3 7042
uid                  Test <test@test.com>
sub   2048R/92C63808 2016-04-26
```
5. Visit [your OpenPGP keys page](https://launchpad.net/~/+editpgpkeys) and paste the fingerprint into the correspondent field in this page. For the give example this would be `EB6E ABC8 39B2 DF55 C031  44D5 FBA1 8466 89E3 7042`.
6. **Launchpad** is going to check the Ubuntu key server for your key and, if successful, send you an encrypted email asking you to confirm the key import.
7. Check the email account that Launchpad has sent the confirmation email to. If your email client supports OpenPGP encryption, it will prompt you for the password you chose for the key when GPG generated it. Enter the password, then click the link to confirm that the key is yours. **Launchpad** encrypts the email, using your public key, so that it can be sure that the key is yours. If your email software doesn't support OpenPGP encryption (for Thunderbird, try the Enigmail extension), copy the encrypted email's contents, type gpg in your terminal, then paste the email contents into your terminal window, followed by ctrl-D (an EOF character). 
8. Back on the  **Launchpad** website, use the Confirm button and  **Launchpad** will complete the import of your OpenPGP key. Then follow the instructions.
9. Install **packaging-dev**

 ```
sudo apt-get install packaging-dev
```
10. Edit your ~/.bashrc file and add something like the following in there (for the given example)

 ```
export DEBFULLNAME="Test" 
export DEBEMAIL="test@test.com"
```
11. Install go

 ```
sudo apt-get install golang-go
mkdir $HOME/go
```
12. Again, edit your ~/.bashrc file and add **GOPATH** and **BIN** to **PATH** 

 ```
export GOPATH="$HOME/go"
export PATH=${PATH}:$GOPATH/bin
```
13.  Don't forget to run `source ~/.bashrc`or to restart your terminal 

## Running
With all set do the following steps:
1. Run the above command to keep your gpg key cached for 600 seconds in your current session (according to this [doc](https://www.gnupg.org/documentation/manuals/gnupg/Agent-Options.html))

 ```
eval $(gpg-agent --daemon)
```
2. Run `make dist`. If everything is fine this is going to build and dist for every distribution informed at the [env](bin/env) file.