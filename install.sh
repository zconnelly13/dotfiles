# copy over dotfiles
for f in .*rc
do
    rm ~/$f
    cp $f ~/$f
done

# install vundles
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall 
echo ":colorscheme Tomorrow-Night-Eighties" >> ~/.vimrc
