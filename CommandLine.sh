#!/bin/bash
input_file="vodclickstream_uk_movies_03.csv"

# 1. What is the most-watched Netflix title?
# group by the uniques titles and count the number of occurrences, saving them in a txt file
awk -F ',' '{print $4}' $input_file | sort | uniq -c | sort -nr > title_count.txt
# get the title from the txt file
most_watched_title=$(head -n 1 title_count.txt | awk '{$1=""; print $0}' | sed 's/^ *//')
echo "Most watched title: $most_watched_title"

# 2. The average time of subsequent clicks on Netflix.com
# filtering the duration tha has to be >= 0.0 and saving the values in a new file
awk -F ',' '{ if ($3 >= 0.0) print $0 }' $input_file > filtered_duration.csv
# the sum of duration (column 3) and the average of them
avg_duration=$(awk -F ',' '{print $3}' filtered_duration.csv | awk '{sum += $1} END {print sum/NR}')
# convert the duration from seconds to minutes
avg_min=$(awk -v avg_duration="$avg_duration" 'BEGIN { avg_min = avg_duration / 60; printf "%.2f\n", avg_min }')
# print the result
echo "Average duration of subsequent clicks: $avg_min minutes"

# 3. ID of the user that has spent the most time on Netflix
# group by the user_id and sum the duration time of each user, then sorting them and saving them in a txt file
awk -F ',' 'NR>1 { sum[$NF] += $3 } END { for (i in sum) print i, sum[i] }' filtered_duration.csv | sort -k2,2nr > sorted_users.txt
# get the user_id from the txt file
high_time_user=$(head -n 1 sorted_users.txt | awk '{print $1}')
echo "The user that has spent the most time on Netflix: $high_time_user"



