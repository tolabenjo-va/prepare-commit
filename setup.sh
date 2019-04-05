#!/bin/bash
TEMPLATE_DIR="~/.git-templates"
HOOK_FILE="prepare-commit-msg"
# check if a template dir exist
printf "Checking if git template folder exists...\n"
EXISTING_TEMPLATE_DIR="$(git config --path --get init.templatedir)"
if [ ! -d "$EXISTING_TEMPLATE_DIR" ]; then
	printf "Configuring git template folder...\n"
	git config --global init.templatedir $TEMPLATE_DIR
else
	printf "Setting git template folder to existing dir...\n"
	TEMPLATE_DIR=$EXISTING_TEMPLATE_DIR
fi

printf "Setting up hooks folder...\n"
HOOKS_FOLDER="$TEMPLATE_DIR/hooks/"
# check if the hooks dir exist, if not, create one
if [ ! -d "$HOOKS_FOLDER" ]; then
	printf "Creating hooks folder...\n"
	mkdir -p $HOOKS_FOLDER
fi
# copy the hook to the hooks folder
printf "Copying hook file to hooks folder...\n"
cp $HOOK_FILE $HOOKS_FOLDER
printf "Changing permission for hook file...\n"
chmod a+x $HOOKS_FOLDER$HOOK_FILE
printf "\nFinished!\n"