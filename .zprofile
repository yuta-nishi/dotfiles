# latex setting
# Set the path in zprofile to use it in Latex Workshop of VS Code.
if [[ ":$PATH:" != *":/Library/Tex/texbin:"* ]]; then
    export PATH="$PATH:/Library/Tex/texbin"
fi
