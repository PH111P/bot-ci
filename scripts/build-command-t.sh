#!/bin/sh
. scripts/common/main.sh

mkdir -p deps/vim-plugins
mkdir -p build/vim-plugins

cd build/vim-plugins
git clone --depth=1 https://github.com/wincent/Command-T command-t

cd command-t/ruby/command-t
ruby extconf.rb
make

cd ../..
mv .git ../.git-command-t
cd ..
tar czvf $ROOT/deps/vim-plugins/command-t.tar.gz command-t
mv .git-command-t command-t/.git

cd $ROOT/deps
git add vim-plugins/command-t.tar.gz
git commit -m "Update Command-T

git head:

$(cd "${ROOT}/build/vim-plugins/command-t" && git show --no-patch HEAD | indent)"