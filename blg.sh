
function init()
{
    echo "开始初始化..."
    sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux stable main@' $PREFIX/etc/apt/sources.list
    apt update && apt upgrade -y
    apt install termux-tools termux-api -y
    termux-setup-storage
    apt install openssh git nodejs -y
    npm config set registry https://registry.npm.taobao.org --global
    npm config set disturl https://npm.taobao.org/dist --global
    npm install hexo-cli -g
    echo "恭喜您，初始化成功！"
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
    echo "恭喜您，设置完成！"
}

function genKey()
{
    echo "正在生成..."
    ssh-keygen -t rsa -C "$GITHUB_EMAIL" -f ~/.ssh/github_rsa
    cat ~/.ssh/github_rsa.pub | termux-clipboard-set
    echo "新生成的 SSH Key 已经复制到截切版，请直接粘贴 Github 设置中！"
}

function update()
{
    echo "正在拉取最新代码..."
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
    echo "恭喜您，代码更新成功！"
}

function write()
{
    update
    hexo new "${1}"
    echo "新文章文件已经生成到 /sdcard/downloads/blog/$BLOG_DOMAIN/source/_posts 下，请使用 Markdown 编辑器继续撰写！"
}

function preview()
{
    cd $LOCAL_STORAGE/$BLOG_DOMAIN
    hexo clean
    hexo s -g
    termux-clipboard-set 'http://localhost:4000'
    echo "本地服务器地址已经复制到截切版，请直接粘贴到浏览器打开！"
    echo "如需停止预览，请按 Ctrl + C ！"
}

function deploy()
{
    echo "正在部署..."
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
    echo "恭喜您，源文件和编译文件都已部署成功！"
}



case $1 in
    'init') init
    ;;
    'set') set
    ;;
    'key') genKey
    ;;
    'update') update
    ;;
    'write') write $2
    ;;
    'preview') preview
    ;;
    'deploy') deploy
    ;;
    *) 
    echo "欢迎使用 Blog 助手，您可执行以下命令！"
    echo "blg init           - 安装必要软件"
    echo "blg set            - 设置 Github 账号"
    echo "blg key            - 生成 SSH 密钥"
    echo "blg update         - 拉取 Blog 源码"
    echo "blg write <title>  - 撰写文章"
    echo "blg preview        - 本地预览"
    echo "blg deploy         - 发布到 Github"
esac
