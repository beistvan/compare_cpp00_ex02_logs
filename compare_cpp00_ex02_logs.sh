#!/bin/bash
make -s
echo "Comparing two logs: one from running the account and one from the subject."

executable_name="account"

account_log=$(./${executable_name} | cut -d' ' -f2-)
subject_log=$(cat 19920104_091532.log | cut -d' ' -f2-)

diff <(echo $account_log) <(echo $subject_log)
if [ $? -eq 0 ]; then
    echo "The logs are identical."
else
    echo "The logs are different."
fi
