# Homebrew setting
# ログインシェルの起動時に一度だけPATHなどを設定する。
# caskと非core tapのformula専用。homebrew-coreのformulaはzerobrewが持つ。
eval "$(/opt/homebrew/bin/brew shellenv)"

# zerobrew setting
# brew shellenvは/opt/homebrew/binを先頭に足すので、その後に置いてzerobrewを優先させる。
# (zb initが.zshenvへ書き戻した場合はこの行に統合する)
if [[ ":$PATH:" != *":$ZEROBREW_PREFIX/bin:"* ]]; then
  export PATH="$ZEROBREW_PREFIX/bin:$ZEROBREW_PREFIX/sbin:$PATH"
fi

# LaTeX setting
# VSCodeのLaTeX Workshopからも利用できるよう、ログイン時にPATHへ追加する。
if [[ ":$PATH:" != *":/Library/Tex/texbin:"* ]]; then
  export PATH="/Library/Tex/texbin:$PATH"
fi
