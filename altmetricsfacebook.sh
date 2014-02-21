#!/bin/bash
link="https://graph.facebook.com/fql?q=SELECT%20url,%20normalized_url,%20share_count,%20like_count,%20comment_count,%20total_count,%20commentsbox_count,%20comments_fbid,%20click_count%20FROM%20link_stat%20WHERE%20url=%27"
linkfim="%27"

echo -e "url\tclick_count\tshare_count\tlike_count\tcomment_count\ttotal_count\tcommentsbox_count\tnormalized_url" > outputfacebook.csv

cat $1 | while read lin ; do curl $link$lin$linkfim |  jq -r '.data[] | .url,.click_count,.share_count,.like_count,.comment_count,.total_count,.commentsbox_count,.normalized_url' | tr "\n" "\t" | cat - <(echo) >> outputfacebook.csv ; done;