#!/bin/bash

sed -i 's|^/debian/|#/debian/|g' .gitignore

echo "" >> .gitignore
echo "# Droidian" >> .gitignore
echo "!.gitmodules" >> .gitignore
echo "!debian" >> .gitignore
echo "!debian/changelog" >> .gitignore
echo "debian/path-override" >> .gitignore
echo "debian/*.substvars" >> .gitignore
echo "debian/*.debhelper" >> .gitignore
echo "debian/files" >> .gitignore
echo "debian/debhelper-build-stamp" >> .gitignore
echo "debian/linux-*/" >> .gitignore
echo "debian/*.postinst" >> .gitignore
echo "out/" >> .gitignore
echo "#" >> .gitignore
echo "# Added by Droidian" >> .gitignore
echo "!.circleci/" >> .gitignore
echo "#" >> .gitignore
echo "# Aded by Berbascum" >> .gitignore
echo "#compile-droidian-kernel.sh" >> .gitignore
echo "build-berb*.log" >> .gitignore
echo "droidian/python" >> .gitignore
echo "" >> .gitignore
echo "## Folllow patches from droidian dir" >> .gitignore
echo "!droidian/patches" >> .gitignore
echo "!droidian/**/*.patch" >> .gitignore
