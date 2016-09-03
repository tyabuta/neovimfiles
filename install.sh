
nvimDir=~/.config/nvim
mkdir -p $nvimDir
mkdir -p $nvimDir/rc

ln -snf $PWD/init.vim $nvimDir/init.vim
ln -snf $PWD/dein.toml $nvimDir/rc/dein.toml
ln -snf $PWD/dein_lazy.toml $nvimDir/rc/dein_lazy.toml

echo "done."

