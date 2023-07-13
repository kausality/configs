set -e

echo 'Installing programs...'
sudo apt-get install zsh git tmux -y
wget -O ~/.ozsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
chmod a+x ~/.ozsh.sh 
bash -c 'source ~/.ozsh.sh --unattended'
rm ~/.ozsh.sh

export ZSH_CUSTOM=~/.oh-my-zsh/custom/

echo 'Downloading zsh-autosuggestions plugin...'
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions

echo 'Downloading zsh-syntax-highlighting plugin...'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting

echo 'Setting symbolic links...'
ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf

echo 'Updating zshrc...'
cat base_zshrc.txt >> ~/.zshrc
