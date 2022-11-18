mldh(){
#MOVE LATEST DOWNLOAD HERE
#Moves latest downloaded file to your PWD
FILE_NAME="$(ls -t $HOME/Downloads | head -n1)"
mv "$HOME/Downloads/$FILE_NAME" "$PWD"
echo ">>mldh: $FILE_NAME moved to $PWD"
};

