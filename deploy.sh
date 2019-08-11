#!/bin/bash

SOURCES="/home/logi/git/github/hexo/"
DEPLOY="/home/logi/git/github/deploy.sh"
GITHUB_PAGES="/home/logi/git/github/vcheckzen.github.com"
GITHUB_PAGES_BACKUP="/home/logi/git/github/vcheckzen.github.com.bak"

# 推送编译后文件
cd $SOURCES
hexo clean
hexo g

cd $GITHUB_PAGES
git checkout master
rm -rf *
cp -r "$SOURCES/public/"* $GITHUB_PAGES
cp "$GITHUB_PAGES_BACKUP/404.html" $GITHUB_PAGES
cp "$GITHUB_PAGES_BACKUP/favicon".* $GITHUB_PAGES
cp "$GITHUB_PAGES_BACKUP/robots.txt" $GITHUB_PAGES
cp -r "$GITHUB_PAGES_BACKUP/customized" $GITHUB_PAGES
git add -A
git commit -m "feat(article): write a new article"
git push -f

# 推送源文件
git checkout source
rm -rf *
cp $DEPLOY ./
cp -r $SOURCES ./
cp -r $GITHUB_PAGES_BACKUP ./
git add -A
git commit -m "feat(article): write a new article"
git push -f

# ~/.backup
