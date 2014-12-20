#!/bin/bash

# git filter-branch -f --env-filter \
#     'if [ $GIT_COMMIT = 695a1143708eeab55fd97d5c3bf2a3ceb8a48690 ]
#      then
#          export GIT_AUTHOR_DATE="Wed Dec 18 19:12:23 2014 -0500"
#          export GIT_COMMITTER_DATE="Wed Dec 18 19:12:23 2014 -0500"
#      fi'

NEW_DATE=$(date -v-$2d)

Commit=$1


git filter-branch -f --env-filter \
    'if [ $GIT_COMMIT = "'"$Commit"'" ]
     then
         export GIT_AUTHOR_DATE="'"$NEW_DATE"'"
         export GIT_COMMITTER_DATE="'"$NEW_DATE"'"
     fi'
