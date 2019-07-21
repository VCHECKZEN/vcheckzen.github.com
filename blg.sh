
function init()
{
    apt update && apt upgrade -y
    apt install termux-tools termux-api -y
    termux-setup-storage
    apt install openssh git nodejs -y
    npm config set registry https://registry.npm.taobao.org --global
    npm config set disturl https://npm.taobao.org/dist --global
    npm install hexo-cli -g
}

function set()
{
    echo "请输入注册 Github 使用的邮箱："
    read email
    echo "请输入 Github 仓库的 ssh 协议地址："
    read repo
    user=`echo $repo | sed 's|.*:\(.*\)/.*|\1|g'`
    domain=`echo $repo | sed 's|.*/\(.*\).git|\1|g'`
    
    git config --global user.name "$user"
    git config --global user.email "$email"
    
    cat > ~/.blogrc <<EOF
    GITHUB_USER="$user"
    GITHUB_EMAIL="$email"
    BLOG_DOMAIN="$domain"
    BLOG_REPOSITORY="$repo"
    LOCAL_STORAGE="~/storage/downloads/blog/"
EOF
    
    cat >> ~/.blogrc <<'EOF'
    [ `pgrep ssh-agent` ] && pkill ssh-agent
    eval `ssh-agent -s` >/dev/null 2>&1
    keys=(`ls ~/.ssh/*.pub 2>/dev/null | sed 's/.pub//g' | xargs`)
    for key in ${keys[@]}
    do
        ssh-add $key >/dev/null 2>&1
    done
    source ~/.blogrc
EOF
    
    if [[ ! `fgrep blogrc ~/.bashrc` ]]; then
        echo "source ~/.blogrc" >> ~/.bashrc
    fi
}

function genKey()
{
    ssh-keygen -t rsa -C "$GITHUB_EMAIL" -f ~/.ssh/github_rsa
    cat ~/.ssh/github_rsa.pub | termux-clipboard-set
}

function update()
{
    if [[ ! -d $LOCAL_STORAGE ]]; then
        mkdir -p $LOCAL_STORAGE
    fi
    
    cd $LOCAL_STORAGE
    if [[ ! -d .git ]]; then
        git clone -b source "${BLOG_REPOSITORY}"
    fi
    
    cd $BLOG_DOMAIN
    git pull
    npm install --no-bin-links
}

function write()
{
    update
    hexo new "${1}"
}

function preview()
{
    cd $LOCAL_STORAGE/$BLOG_DOMAIN
    hexo clean
    hexo s -g
}

function deploy()
{
    cd $LOCAL_STORAGE/$BLOG_DOMAIN
    hexo clean
    hexo g
    git add -A
    git commit -m "feat[all]: regular update"
    git push origin source -f
    
    cd public
    git init
    git remote add origin "${BLOG_REPOSITORY}"
    git add -A
    git commit -m "feat[all]: regular update"
    git push origin master -f
}

