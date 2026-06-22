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
