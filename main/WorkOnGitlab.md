# 在Gitlab上工作
## 一. 导入项目
1. clone你fork过来的项目  
`
git clone git@gitlab.com:jasonx/sandbox.git
`
2. 把上游的repo加入到remote，命名为upstream  
`
git remote add upstream git@gitlab.com:sandbox/sandbox.git
`
3. check一下  
`
git remote -v
`
4. 把上游的最新更新同步到本地  
`
git fetch upstream
`
5. 确认当前分支在develop  
`
 git branch
* develop
`
6. 如果只有master分支，需要先track一个develop分支到本地  
`
git checkout --track origin/develop
`
7. 把之前fetch到本地的upstream的develop merge到自己的develop分支  
`
git merge upstream/develop
`