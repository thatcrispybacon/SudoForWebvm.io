# Sudo for Webvm
> [!CAUTION]
> **This removes root password and makes you vunerable and protected**  

You can remove root password from user in [webvm.io](https://webvm.io).
`su -`, the defult password is `password`  
you can then trust your user to login:
```
groupadd wheel
usermod -aG wheel user
```  
Then you have to edit the su login file with `nano`  
```
nano /etc/pam.d/su
```
This will open the nano editor where you have to add:
```
auth sufficient pam_wheel.so trust
```
to the top line, this will enable the su - command to not require a password.  
exit anno with `ctrl + o` + `enter` + `ctrl + x`
Now logout of the root shell by using `exit` or `ctrl + d` or `logout`  
Now paste a script to your user to enable `sudo`:
```
cat >> ~/.bashrc <<'EOF'

sudo() {
    if [ "$#" -eq 0 ]; then
        su -
    else
        su -c "$*"
    fi
}
EOF

source ~/.bashrc
```
