1. Вывести список всех удаленных репозиториев для локального.
2. Вывести список всех веток.
 git branch
```
PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov\test_1> 
 *  History restored 

* master

```
3. Вывести последние 3 коммитa с помощью git log.

 git log
```
commit c32a2934c3ecac7f7be1af526af882e224babe27 (HEAD -> master)
Author: alex krylov <kullbro@gmail.com>
Date:   Wed Aug 9 16:52:46 2023 +0300

    Fourth

commit 63233c1988feafc19cd172b4a7d213969591aaa9
Author: alex krylov <kullbro@gmail.com>
Date:   Wed Aug 9 13:19:31 2023 +0300

    dfgdfg

commit d06367a0b1cd4c7c21978e12e623a36f4ed4a0bd
Author: alex krylov <kullbro@gmail.com>
Date:   Wed Aug 9 12:36:16 2023 +0300

    Threed
```
4. Создать пустой файл README.md и сделать коммит.5. Добавить фразу "Hello, DevOps" в README.md файл и сделать коммит.

 New-Item Redme.md
```
----                 -------------         ------ ----
-a----        09.08.2023     17:06              0 Redme.md

```
PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov\test_1> git add Readme.md

PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov\test_1> git commit 
```
[master de1f219] Fiveth
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 Readme.md
```
PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov\test_1> echo Hello,DeVops > Readme.md

PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov\test_1> git add Readme.md

PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov\test_1> git commit    
```
[master f00cc33] Sixth
 1 file changed, 0 insertions(+), 0 deletions(-)
```
6. Сделать реверт последнего коммита. Вывести последние 3 коммитa с помощью git log.

 git revert HEAD
 ```
[master 1b575a2] Revert "Eighyh"
 1 file changed, 1 deletion(-)
```
 git log -p
 
 ````
commit 1b575a2b82ca29fa01173e2914dc0c71db7ab082 (HEAD -> master)
Author: alex krylov <kullbro@gmail.com>
Date:   Wed Aug 9 17:37:15 2023 +0300

    Revert "Eighyh"

    This reverts commit 0dd41c786f7d005584abef05e1262d4030a56442.

diff --git a/Readme.md b/Readme.md
index 0f9f230..e69de29 100644
--- a/Readme.md
+++ b/Readme.md
@@ -1 +0,0 @@
-Hello,DeVops
\ No newline at end of file

commit 0dd41c786f7d005584abef05e1262d4030a56442
Author: alex krylov <kullbro@gmail.com>
Date:   Wed Aug 9 17:35:52 2023 +0300

    Eighyh

diff --git a/Readme.md b/Readme.md
index e69de29..0f9f230 100644
--- a/Readme.md
+++ b/Readme.md
@@ -0,0 +1 @@
+Hello,DeVops
\ No newline at end of file

commit 768a70c7f0a037492049e64945ed177f49bd6fec
Author: alex krylov <kullbro@gmail.com>
Date:   Wed Aug 9 17:26:56 2023 +0300

    Seventh

diff --git a/file_2 b/file_2
index a08b8ca..10bbec4 100644
--- a/file_2
+++ b/file_2
@@ -3,3 +3,5 @@ jkhjk
 fgdfg
 gfhfgh
 l;'
+ghjghj
+ghjhgj
\ No newline at end of file

````
7. Удалить последние 3 коммита с помощью git reset.8. Вернуть коммит, где добавляется пустой файл README.md. Для этого найти ID коммита в git reflog, а затем сделать cherry-pick.

git reset --hard 3bb5bcfc11a824342cd34d68494f1e174d5b88e8  
````
HEAD is now at 3bb5bcf first
````
PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov\test_1> git reflog  
````
5417e3c HEAD@{1}: commit: 3_T
bc612a4 HEAD@{2}: commit: 2_S
bc65f0b HEAD@{3}: commit: 1_F
3bb5bcf (HEAD -> master) HEAD@{4}: reset: moving to 3bb5bcfc11a824342cd34d68494f1e174d5b88e8
633a9b3 HEAD@{5}: reset: moving to 633a9b3e1be75987bb2dc508e46ed7d0789a7219
ea2b255 HEAD@{6}: commit: 3
be626ec HEAD@{7}: commit: 2
````
PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov\test_1> git cherry-pick bc65f0b  
````
[master 7a1a33b] 1_F
 Date: Wed Aug 9 18:42:38 2023 +0300
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 Readme.md
 ````
9. Удалить последний коммит с помощью git reset.

git reset --hard 3bb5bcfc11a824342cd34d68494f1e174d5b88e8 

````
HEAD is now at 3bb5bcf first
````
10. Переключиться на ветку main или master. Если ветка называется master, то переименовать её в main.

git checkout main
````                                           
Switched to branch 'main'
````
11. Скопировать файл https://github.com/tms-dos17-onl/_sandbox/blob/main/.github/workflows/validate-shell.yaml, положить его по такому же относительному пути в репозиторий. Создать коммит и запушить его в удаленный репозиторий.

git add 

git pull
````
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (3/3), done.
Unpacking objects: 100% (4/4), 2.24 KiB | 15.00 KiB/s, done.
From https://github.com/tms-dos17-onl/Alex-Krylov
   bbf45ad..00cd484  main       -> origin/main
Merge made by the 'ort' strategy.
 HW_7/Conclusion.md | 159 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 HW_7/Conclusion.md
````
PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git push --all
````
Enumerating objects: 21, done.
Counting objects: 100% (21/21), done.
Delta compression using up to 6 threads
Compressing objects: 100% (11/11), done.
Writing objects: 100% (19/19), 1.57 KiB | 805.00 KiB/s, done.
Total 19 (delta 4), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (4/4), completed with 1 local object.
To https://github.com/tms-dos17-onl/Alex-Krylov.git
   00cd484..f03dc5c  main -> main

````



