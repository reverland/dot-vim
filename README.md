这里是我的vim配置文件
It's my configuration of vim on archlinux x86_64

How to use it
============

    git submodule add http://github.com/reverland/pluginname.git bundle/pluginname
    git add .
    git commit -m "update"
    ln -s .vimrc ~/
    
upgrading a plugin bundle
============

cd ~/.vim/bundle/pluginname
git pull origin master

upgrading all bundled plugins
============

git submodule foreach git pull origin master

removing a plugin
============

     remove it from .gitmodules
     remove it from .git/config
     git rm --cached bundle/pluginname

[See also:http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)
