# تحديد مسار الـ Custom لتجنب الضياع
ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# تحميل الثيم Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM_DIR/themes/powerlevel10k"

# تحميل إضافة Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting"

# تحميل إضافة Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions"

# تفعيل التغييرات (اختياري إذا كنت لسه ما عدلت الـ .zshrc)
source ~/.zshrc
