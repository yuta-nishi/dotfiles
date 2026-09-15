# Homebrew setting
# ログインシェルの起動時に一度だけPATHなどを設定する。
eval "$(/opt/homebrew/bin/brew shellenv)"

# LaTeX setting
# VSCodeのLaTeX Workshopからも利用できるよう、ログイン時にPATHへ追加する。
if [[ ":$PATH:" != *":/Library/Tex/texbin:"* ]]; then
  export PATH="/Library/Tex/texbin:$PATH"
fi
