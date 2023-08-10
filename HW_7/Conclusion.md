1. Вывести список всех удаленных репозиториев для локального.

 PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git remote -v
 ````
origin  https://github.com/tms-dos17-onl/Alex-Krylov.git (fetch)
origin  https://github.com/tms-dos17-onl/Alex-Krylov.git (push)

````
3. Вывести список всех веток.
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

12. Создать из ветки main ветку develop. Переключиться на неё и создать README.md в корне репозитория. Написать в этом файле какие инструменты DevOps вам знакомы и с какими вы бы хотели познакомиться больше всего (2-3 пункта).


 git branch develop
 
PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git checkout develop  
````
Switched to branch 'develop'
````

PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> New-Item Readme.md
````
----                 -------------         ------ ----
-a----        09.08.2023     21:23              0 Readme.md
````

PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git add Readme.md   

PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git commit
````
[develop 122bb67] 2
 1 file changed, 1 insertion(+)
 ````

13. Создать из ветки main ветку support и создать там файл LICENSE в корне репозитория с содержимым https://www.apache.org/licenses/LICENSE-2.0.txt. Создать коммит. Вывести последние 3 коммитa.


PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git checkout support

````
Switched to branch 'support'
````
PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> New-Item LICENSE    

````

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        09.08.2023     21:43              0 LICENSE
````

PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git add LICENSE   

PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git cimmit     
````
The most similar command is
 1 file changed, 201 insertions(+)
 create mode 100644 LICENSE
 ````

PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git log 
````
commit 1c456b2f21da756d13504e1d80cab0d5f822e03a (HEAD -> support)
Author: alex krylov <kullbro@gmail.com>
Date:   Wed Aug 9 21:44:33 2023 +0300

    Work

commit 122bb674deaa37a2edb4ac78d57b60917c254272 (develop)
Author: alex krylov <kullbro@gmail.com>
Date:   Wed Aug 9 21:25:54 2023 +0300

    2

commit 842218f51022d106df263273dde1f841306f4397
Author: alex krylov <kullbro@gmail.com>
Date:   Wed Aug 9 21:23:41 2023 +0300

    1

````
14. Переключиться обратно на ветку main и создать там файл LICENSE в корне репозитория с содержимым https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt. Создать коммит. Вывести последние 3 коммитa.


PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git checkout main 
````
Switched to branch 'main'
D       .githab/workflows/validate-shell.yaml
Your branch is up to date with 'origin/main'.
````
PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> New-Item LICENSE    

````

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
````

PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git add LICENSE   

PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git commit
````
[main 580c418] 1
 1 file changed, 20 insertions(+)
 create mode 100644 LICENSE
 ````
PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git log
````
commit 580c41828035eac569f9bdcb08ccca65c2559ca7 (HEAD -> main)
Author: alex krylov <kullbro@gmail.com>
Date:   Wed Aug 9 21:50:07 2023 +0300

    1

commit ecb2cfbb7e10181b6d597b34f07f8cd3afda034a (origin/main, origin/HEAD)
Author: Alex777888777 <139115675+Alex777888777@users.noreply.github.com>
Date:   Wed Aug 9 21:13:12 2023 +0300

    Update Conclusion.md

commit 22119687b940e3324a03a300f42ac518d9b90647
Author: Alex777888777 <139115675+Alex777888777@users.noreply.github.com>
Date:   Wed Aug 9 20:25:34 2023 +0300

    Delete test directory

````
15. Сделать merge ветки support в ветку main и решить конфликты путем выбора содержимого только одной лицензии.

PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git merge support
````
Auto-merging LICENSE
CONFLICT (add/add): Merge conflict in LICENSE
Automatic merge failed; fix conflicts and then commit the result.
PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git add LICENSE 
````
PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git commit        

16. Переключиться на ветку develop и сделать rebase относительно ветки main.
PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git rebase main     
````
Successfully rebased and updated refs/heads/develop.
````
17. Вывести историю последних 10 коммитов в виде графа с помощью команды git log -10 --oneline --graph.

PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git log -10 --oneline --graph
````
* 75018e4 (HEAD -> develop, main) Revert "1"
*   65ddac5 Merge branch 'support'
|\
| * 1c456b2 (support) Work
| * 122bb67 2
* | 580c418 1
|/
* ecb2cfb (origin/main, origin/HEAD) Update Conclusion.md
* c7ed1a4 Delete test_work directory
*   f03dc5c Merge branch 'main' of https://github.com/tms-dos17-onl/Alex-Krylov
|\
````
18. Запушить ветку develop. В истории коммитов должен быть мерж support -> main.

PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git pull
````
remote: Enumerating objects: 26, done.
remote: Counting objects: 100% (26/26), done.
remote: Compressing objects: 100% (21/21), done.
remote: Total 23 (delta 10), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (23/23), 6.28 KiB | 7.00 KiB/s, done.
From https://github.com/tms-dos17-onl/Alex-Krylov
   ecb2cfb..ed73152  main       -> origin/main
There is no tracking information for the current branch.
Please specify which branch you want to merge with.

    git pull <remote> <branch>

If you wish to set tracking information for this branch you can do so with:

    git branch --set-upstream-to=origin/<branch> develop
````
PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git push --set-upstream origin develop
````
Enumerating objects: 18, done.
Counting objects: 100% (18/18), done.
Delta compression using up to 6 threads
Compressing objects: 100% (16/16), done.
Writing objects: 100% (17/17), 5.81 KiB | 1.45 MiB/s, done.
Total 17 (delta 8), reused 0 (delta 0), pack-reused 0
remote:
remote: Create a pull request for 'develop' on GitHub by visiting:
remote:      https://github.com/tms-dos17-onl/Alex-Krylov/pull/new/develop
To https://github.com/tms-dos17-onl/Alex-Krylov.git
 * [new branch]      develop -> develop
branch 'develop' set up to track 'origin/develop'.
````

PS D:\G\!\Tа\DeVopS\Git\Alex-Krylov> git log -10 --oneline --graph
````
* 75018e4 (HEAD -> develop, origin/develop) Revert "1"
*   65ddac5 Merge branch 'support'
|\
| * 1c456b2 (support) Work
| * 122bb67 2
* 75018e4 (HEAD -> develop, origin/develop) Revert "1"
*   65ddac5 Merge branch 'support'
|\
| * 1c456b2 (support) Work
| * 122bb67 2
| * 842218f 1
* | 580c418 1
|/
* ecb2cfb Update Conclusion.md
* 2211968 Delete test directory
* c7ed1a4 Delete test_work directory
*   f03dc5c Merge branch 'main' of https://github.com/tms-dos17-onl/Alex-Krylov
|\
(END)
````
19. Зайти в свой репозиторий на GitHub и создать Pull Request из ветки develop в ветку main.


Готово
