Open a ssh session
```
sudo apt-get install rng-tools
```

In another SSH window open
````
gpg --gen--key
```
Go back to your first SSH session and run
```
sudo rngd -r /dev/urandom
```
Let this run till gpg generates your keys!

Then you can kill **rngd**
```
sudo kill -9 $(pidof rngd)
```
