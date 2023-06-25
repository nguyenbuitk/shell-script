# SUBSITITUDE WITH SED
```bash
echo 'I love my wife.' > love.txt
sed 's/my wife/sed/' love.txt
# I love sed.
```
``` bash
sed 's/MY WIFE/sed/' love.txt
# I love my wife.
sed 's/search-pattern/replacement-string/flags'
sed 's/MY WIFE/sed/i' love.txt
# I love sed.

sed 's/MY WIFE/sed/I' love.txt
# I love sed.

echo 'This is line 2.' >> love.txt
echo 'I love my wife with all of my heart.' >> love.txt

sed 's/my wife/sed/' love.txt
# I love sed.
# This is line 2.
# I love sed with all of my heart.
```

```bash
echo 'I love my wife and my wife loves me. Also, my wife loves cat' >> love.txt
sed 's/my wife/sed/' love.txt # just replace the first appear of each line

# I love sed.
# This is line 2.
# I love sed with all of my heart.
# I love sed and my wife loves me. Also, my wife loves cat

sed 's/my wife/sed/g' love.txt # replace all apperance

# I love sed.
# This is line 2.
# I love sed with all of my heart.
# I love sed and sed loves me. Also, sed loves cat

sed 's/my wife/sed/g' love.txt > my-new-love.txt # output to new file
sed -i.bak 's/my wife/sed/' love.txt # create a backup of origin file and replace the origin file data

sed 's/love/like/gw like.txt' love.txt # chỉ lưu những dòng có sự thay thế
```

# SED IN PINELINE
```bash
# 2 command giống nhau
cat like.txt | sed 's/my wife/sed/g'
sed 's/my wife/sed/g' like.txt

# sed có thể hoạt động với bất cứ delimiter character nào (được chỉ định bằng ký tự đứng sau s)
# 3 command này có output giống nhau, đều là /export/user/jasonc
echo '/home/jason' | sed 's/\/home\/jason/\/export\/user\/jasonc/'
echo '/home/jason' | sed 's#/home/jason#/export/user/jasonc#'
echo '/home/jason' | sed 's?/home/jason?/export/user/jasonc?'

```


# REMOVE OR DELETE COMMAND WITH SED
```bash
cat love.txt
# I love sed.
# This is line 2.
# I love sed with all of my heart.
# I love sed and my wife loves me. Also, my wife loves cat

sed '/This is/d' love.txt
# I love sed.
# I love sed with all of my heart.
# I love sed and my wife loves me. Also, my wife loves cat

sed '/love/d' love.txt
# This is line 2

echo '# User to run service as.' > config
echo 'User apache' >> config
echo >> config
echo '# Group to run service as.' >> config
echo 'Group apache' >> config
cat config

# remove command line
sed '/^#/d' config
# User apache

# Group apache

# remove blank line
sed '/^$/d' config # ký tự ^(bắt đầu dòng) được theo ngay sau bởi $(kết thúc dòng)
# # User to run service as.
# User apache
# # Group to run service as.
# Group apache

# how to cobine two command `sed '/^#/d' config` and `sed '/^$/d' config`
sed '/^#/d ; /^$/d' config
# User apache
# Group apache

sed '/^#/d ; /^$/d ; s/apache/httpd/' config
sed -e '/^#/d' -e '/^$/d' -e 's/apache/httpd/' config
# User httpd
# Group httpd


# sử dùng file có chứa sed command
echo '/^#/d' > script.sed
echo '/^$/d' >> script.sed
echo 's/apache/httpd/' >> script.sed

sed -f script.sed config
# User httpd
# Group httpd

```
# Use address to work on range of line
```bash
Address được sử dụng nhằm chỉ định sed được thực hiện trên line nào, default là thực hiện trên toàn bộ line
sed '2 s/apache/httpd/' config # chỉ thay đổi dòng 2
sed '2s/apache/httpd/' config
<!-- # User to run service as.
User httpd

# Group to run service as.
Group apache -->

sed '/Group/ s/apache/httpd/' config # just change the line contain word 'Group'
sed '1,3 s/run/execute/' config
```
